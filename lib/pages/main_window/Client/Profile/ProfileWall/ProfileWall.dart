import 'package:flutter/material.dart';
import 'package:vkontakte/model/User.dart';
import 'package:vkontakte/model/screens/ProfileModel.dart';
import 'package:vkontakte/pages/main_window/Client/widgets/UserMini.dart';
import 'package:vkontakte/util.dart' as util;

class ProfileWall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<User>> _friends = profileModel.getFriends(util.userId);
    return FutureBuilder<List<User>>(
        future: _friends,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                return Container(
                    height: 90,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: UserMini(
                                user: snapshot.data[index],
                              ));
                        }));
              }
              return Center(child: CircularProgressIndicator());
          }
        });
  }
}
