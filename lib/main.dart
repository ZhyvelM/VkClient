import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vk_login/flutter_vk_login.dart';
import 'package:vkontakte/cubit/auth_cubit.dart';
import 'package:vkontakte/screens/Auth.dart';
import 'package:vkontakte/screens/Client.dart';

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
