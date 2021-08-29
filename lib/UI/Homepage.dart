import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task/Repository/data_repository.dart';
import 'package:task/UI/pages/drawer_page.dart';
import 'package:task/UI/pages/photos_page.dart';
import 'package:task/UI/pages/posts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController _controller = PageController();
  late dynamic data = null;
  @override
  void initState() {
    ApiRepository.getSinglePost("1").then((value) {
      setState(() {
        data = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: DrawerPage(),
        body: PageView(
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          controller: _controller,
          children: [
            PhotosPage(),
            PostsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              _controller.jumpToPage(index);
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Photos",
              icon: Icon(Icons.photo_album),
            ),
            BottomNavigationBarItem(
              label: "Posts",
              icon: Icon(Icons.post_add_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
