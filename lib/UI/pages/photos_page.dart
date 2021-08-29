import 'package:flutter/material.dart';
import 'package:task/Repository/data_repository.dart';
import 'package:task/model/photo.dart';

class PhotosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PhotosPageState();
}

class PhotosPageState extends State<PhotosPage> {
  List<Photos> data = [];
  @override
  void initState() {
    super.initState();
    ApiRepository.getPhotos().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(229, 232, 249, 1),
        margin: EdgeInsets.only(top: 10),
        child: data.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ImageCardFeed(
                    imageData: data[index],
                  );
                },
              ));
  }
}

class ImageCardFeed extends StatelessWidget {
  final Photos imageData;
  const ImageCardFeed({required this.imageData});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4,
          ),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 150,
                                width: 150,
                                child: Image.network(imageData.thumbnailUrl),
                              );
                            });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(imageData.thumbnailUrl),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, left: 30.0, right: 10.0, bottom: 10),
                  child: Text(
                    imageData.title,
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
