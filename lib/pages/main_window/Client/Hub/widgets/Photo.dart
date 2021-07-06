import 'package:flutter/material.dart';
import 'package:vkontakte/model/AlbumPhoto.dart';

class PhotoWidget extends StatelessWidget{

  final AlbumPhoto photo;

  PhotoWidget({@required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photo.urlMin),
        ),
      ),
    );
  }

}