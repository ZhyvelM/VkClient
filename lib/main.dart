import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vk_sdk/flutter_vk_sdk.dart';
import 'package:vkontakte/cubit/auth_cubit.dart';
import 'package:vkontakte/screens/Auth.dart';
import 'package:vkontakte/screens/Client.dart';

void main() {
  initVKSdk();
  runApp(MaterialApp(home: MyApp()));
}

initVKSdk() {
  return FlutterVKSdk.init(appId: '7875023');
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
