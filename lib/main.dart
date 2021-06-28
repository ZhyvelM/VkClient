import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vk_login/flutter_vk_login.dart';
import 'package:vkontakte/pages/main_window/Auth.dart';
import 'package:vkontakte/pages/main_window/Client/Client.dart';

import 'pages/main_window/cubit/auth_cubit.dart';
import 'util.dart' as util;

void main() {
  util.vkSignIn = new FlutterVkLogin();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return Auth();
            } else {
              return Client();
            }
          },
        ));
  }
}
