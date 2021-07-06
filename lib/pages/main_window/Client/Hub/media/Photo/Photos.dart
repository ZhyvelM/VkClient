import 'package:flutter/material.dart';
import 'package:vkontakte/model/Album.dart';
import 'package:vkontakte/model/screens/HubModel.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/media/hub_cubit/hub_cubit.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/widgets/PhotoAlbum.dart';
import 'package:vkontakte/util.dart' as util;
import 'package:flutter_bloc/flutter_bloc.dart';

class Photos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<Album>> albums = hubModel.getAlbums(util.userId);
    return FutureBuilder<List<Album>>(
        future: albums,
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
                return GestureDetector(
                  child:  PhotoAlbum(album: snapshot.data[index]),
                  onTap: (){
                    final hubCubit = BlocProvider.of<HubCubit>(context);
                    hubCubit.goToAlbum(snapshot.data[index].id);
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        });
  }
}
