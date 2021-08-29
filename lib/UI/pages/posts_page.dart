import 'package:flutter/material.dart';
import 'package:task/Repository/data_repository.dart';
import 'package:task/model/post.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post> data = [];
  @override
  void initState() {
    super.initState();
    ApiRepository.getPosts().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: data.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () async {
                        await ApiRepository.getSinglePost(
                                data[index].id.toString())
                            .then((value) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text(value.title),
                                  content: Text(value.body),
                                );
                              });
                        });
                      },
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index].title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index].body,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: data.length,
            ),
    );
  }
}
