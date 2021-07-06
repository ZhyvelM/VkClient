import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/HubInitial.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/media/Photo/Album.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/media/Photo/Photos.dart';
import 'package:vkontakte/pages/main_window/Client/widgets/NavBar.dart';

import 'media/Music.dart';
import 'media/Photo/Photos.dart';
import 'media/Videos.dart';
import 'media/hub_cubit/hub_cubit.dart';

class Hub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (context) => HubCubit(),
          child: BlocBuilder<HubCubit, HubState>(
            builder: (context, state) {
              if (state is PhotosState) {
                return Photos();
              } else if (state is MusicState) {
                return Music();
              } else if (state is VideosState) {
                return Videos();
              } else if (state is AlbumState) {
                return AlbumView(albumId: state.albumId);
              } else
                return HubInitialWidget();
            },
          ),
        ),
        bottomNavigationBar: NavBar(
          currentIndex: 1,
        ));
  }
}
