import 'package:flutter/material.dart';
import 'package:vkontakte/model/User.dart';

class UserMini extends StatelessWidget {
  final User user;

  UserMini({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user.photo50),
          ),
          Text("${user.firstName}"),
          Text("${user.lastName}"),
        ],
      ),
    );
  }
}
