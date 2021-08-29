import 'package:flutter/material.dart';
import 'package:task/Repository/data_repository.dart';
import 'package:task/UI/login_page.dart';
import 'UI/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var token;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    ApiRepository.getUserDataFormLocal().then((value) {
      setState(() {
        loading = false;
        token = value["token"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loading
          ? Center(child: CircularProgressIndicator())
          : token == null
              ? LoginPage()
              : HomePage(),
    );
  }
}
