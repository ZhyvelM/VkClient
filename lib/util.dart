import 'package:flutter/cupertino.dart';
import 'package:flutter_vk_login/flutter_vk_login.dart';

String userId;
int clientId = 7875023;
String accessToken;
FlutterVkLogin vkSignIn;

void init(String userID, String access_token) {
  userId = userID;
  accessToken = access_token;
}

void showPhoto(BuildContext context, String url) {
  Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) =>
          Container(
              decoration: BoxDecoration(
                color: CupertinoColors.black.withOpacity(0.9),
                image: DecorationImage(
                    image: NetworkImage(url)
                ),
              )
          )
  ));
}