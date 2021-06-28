import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkontakte/pages/main_window/Client/Profile/profile_cubit/profile_cubit.dart';
import 'package:vkontakte/pages/main_window/Client/widgets/NavBar.dart';

import 'Edit/Edit.dart';
import 'Header/Header.dart';
import 'ProfileWall/ProfileWall.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
          if (state is ProfileInitial) {
            return Scaffold(
                body: Column(
                  children: [
                    Header(),
                    ProfileWall()
                  ],
                ),
                bottomNavigationBar: NavBar(
                  currentIndex: 2,
                ));
          }
          return Edit();
        }));
  }
}
