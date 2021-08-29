import 'package:flutter/material.dart';
import 'package:task/Repository/data_repository.dart';
import 'package:task/UI/login_page.dart';

import '../dashboard_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Map data = {};
  bool loading = true;
  @override
  void initState() {
    super.initState();
    ApiRepository.getUserDataFormLocal().then((value) {
      setState(() {
        data = {
          "email": value["email"],
          "token": value["token"],
        };
      });
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                ListTile(
                  title: Text(data['email']),
                  subtitle: Text(data['token']),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => DashboardPage()));
                    },
                    tileColor: Colors.blue,
                    title: Center(child: Text("Dashboard Page")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      ApiRepository.signOut().then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      });
                    },
                    child: Text('Logout'),
                  ),
                ),
              ],
            ),
    );
  }
}
