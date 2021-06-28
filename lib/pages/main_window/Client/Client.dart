import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import 'Hub/Hub.dart';
import 'Profile/Profile.dart';
import 'Wall/Wall.dart';
import 'client_cubit/client_cubit.dart';

class Client extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterVKClient"),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
              onPressed: () {
                final authCubit = BlocProvider.of<AuthCubit>(context);
                authCubit.vkLogout();
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: BlocProvider(
          create: (context) => ClientCubit(),
          child: BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
            if (state is toWall) {
              return Wall();
            }
            if (state is toHub) {
              return Hub();
            }
            if (state is toProfile) {
              return Profile();
            }
            return Wall();
          })),
    );
  }
}
