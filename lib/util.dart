import 'package:flutter_vk_login/flutter_vk_login.dart';

int userId;
int clientId = 7875023;
String accessToken;
FlutterVkLogin vkSignIn;

void init(int userID, String access_token) {
  userId = userID;
  accessToken = access_token;
}
