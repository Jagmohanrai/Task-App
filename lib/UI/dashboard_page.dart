import 'package:flutter/material.dart';
import 'componets/appbar.dart';
import 'componets/first_land_card.dart';
import 'componets/second_land_card.dart';
import 'componets/third_card.dart';
import 'componets/first_card.dart';
import 'componets/second_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Appbar(),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Featured Articles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FirstCard(),
                    SizedBox(
                      width: 20,
                    ),
                    SecondCard(),
                    SizedBox(
                      width: 20,
                    ),
                    ThirdCard(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
              child: Text(
                'Featured Videos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  FirstLandCard(),
                  SizedBox(
                    width: 20,
                  ),
                  SecondLandCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ""),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.black45,
                  size: 20,
                ),
                height: 20,
                width: 30,
              ),
              label: ""),
        ],
      ),
    );
  }
}
