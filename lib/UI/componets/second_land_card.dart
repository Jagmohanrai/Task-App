import 'package:flutter/material.dart';

class SecondLandCard extends StatelessWidget {
  const SecondLandCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/photoland2.jpg'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
                child: Text(
              '01:25:00',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
            height: 30,
            width: 80,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.star,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: EdgeInsets.only(left: 90.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.black45,
                  size: 40,
                ),
                height: 40,
                width: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
