import 'package:flutter/material.dart';
import 'package:vkontakte/model/AlbumPhoto.dart';
import 'package:vkontakte/model/screens/HubModel.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/widgets/Photo.dart';
import 'package:vkontakte/util.dart' as util;

class AlbumView extends StatelessWidget {

  final String albumId;

  AlbumView({@required this.albumId});

  @override
  Widget build(BuildContext context) {
    Future<List<AlbumPhoto>> photos = hubModel.getAlbum(util.userId, albumId);
    return Scaffold(
        body: FutureBuilder<List<AlbumPhoto>>(
            future: photos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return PhotoWidget(photo: snapshot.data[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            }
        )
    );
  }
}