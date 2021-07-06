import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vkontakte/model/Album.dart';

class PhotoAlbum extends StatelessWidget {
  final Album album;

  PhotoAlbum({@required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(album.coverUrl),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    album.size.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    album.title,
                    style: TextStyle(color: Colors.white, ),
                  ),
                ],
              )
            ),
          ],
        )
    );
  }
}
