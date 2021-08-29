import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/model/photo.dart';
import 'package:task/model/post.dart';

class ApiRepository {
  Dio client = Dio();
  static Future<List<Photos>> getPhotos() async {
    final url = "http://jsonplaceholder.typicode.com/photos?_start=0&_limit=10";
    List<Photos> data = [];
    await http.get(Uri.parse(url)).then((value) {
      List temp = jsonDecode(value.body);
      temp.forEach((element) {
        data.add(Photos.fromJson(element));
      });
    });
    return data;
  }

  static Future<List<Post>> getPosts() async {
    final url = "http://jsonplaceholder.typicode.com/posts?_start=0&_limit=10";
    List<Post> data = [];
    await http.get(Uri.parse(url)).then((value) {
      List temp = jsonDecode(value.body);
      temp.forEach((element) {
        data.add(Post.fromJson(element));
      });
    });
    return data;
  }

  static Future<Post> getSinglePost(String id) async {
    final url = "http://jsonplaceholder.typicode.com/posts/$id";
    late Post data;
    await http.get(Uri.parse(url)).then((value) {
      var temp = jsonDecode(value.body);
      data = Post.fromJson(temp);
    });
    return data;
  }

  Future<String> signIn(String email, String password) async {
    String data = "";
    try {
      BaseOptions options = new BaseOptions(
        baseUrl: "https://reqres.in/api",
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      Dio dio = new Dio(options);
      Map<String, String> params = Map();
      params['email'] = email;
      params['password'] = password;

      await dio.post("/login", data: params).then((value) async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('email', email);
        sp.setString('token', value.data['token']);
        data = value.data['token'];
      });
    } on Exception catch (e) {
      print(e);
      return "";
    }
    return data;
  }

  static Future<void> signOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }

  static Future<Map> getUserDataFormLocal() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map data = {
      "email": sp.get('email'),
      "token": sp.get('token'),
    };
    return data;
  }

  static Future<Widget> showPostDialog(String id) async {
    Widget data = SizedBox();
    await getSinglePost(id).then((value) {
      data = ListTile(
        title: Text(value.title),
        subtitle: Text(value.body),
      );
    });
    return data;
  }
}
