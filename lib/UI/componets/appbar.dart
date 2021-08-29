import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            height: 20,
            width: 20,
            child: Image.asset('assets/images/MenuIcon.png'),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Home',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 160,
          ),
          Container(
            height: 60,
            width: 60,
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/photo.jpeg'),
          ),
        ],
      ),
    );
  }
}
