import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkontakte/cubit/auth_cubit.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(
            "Login",
            style: TextStyle(fontSize: 15, color: Colors.yellow),
          ),
          onPressed: () {
            final authCubit = BlocProvider.of<AuthCubit>(context);
            authCubit.vkLogin();
          },
        ),
      ),
    );
  }
}
