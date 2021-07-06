import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/media/hub_cubit/hub_cubit.dart';
import 'package:vkontakte/pages/main_window/Client/Hub/widgets/HubButtons.dart';

class HubInitialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hubCubit = BlocProvider.of<HubCubit>(context);
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 10),
      crossAxisCount: 3,
      children: [
        HubButton(
          icon: Icons.photo,
          text: "Photos",
          callBack: () {
            hubCubit.goToPhotos();
          },
          color: Colors.greenAccent,
        ),
        HubButton(
          icon: Icons.music_note_rounded,
          text: "Music",
          callBack: () {
            hubCubit.goToMusic();
          },
          color: Colors.redAccent,
        ),
        HubButton(
          icon: Icons.video_collection,
          text: "Videos",
          callBack: () {
            hubCubit.goToVideos();
          },
          color: Colors.orangeAccent,
        ),
        HubButton(
          icon: Icons.notes_rounded,
          text: "Notes",
          callBack: () {
            hubCubit.goToNotes();
          },
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}
