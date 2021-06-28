import 'package:flutter_vk_login/flutter_vk_login.dart';
import 'package:vkontakte/util.dart' as util;

class Authentication {
  static Future<bool> Login() async {
    final VkLoginResult result = await util.vkSignIn.logIn([
      'friends',
      'photos',
      'audio',
      'video',
      'status',
      'notes',
      'wall',
    ]);
    switch (result.status) {
      case VKLoginStatus.loggedIn:
        final VKAccessToken accessToken = result.token;
        print('''
         Logged in!         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expiresIn}
         Permissions: ${accessToken.scope}
         ''');
        util.init(accessToken.userId, accessToken.token);
        return true;
      case VKLoginStatus.cancelledByUser:
        print('## Login cancelled by the user.');
        return false;
      case VKLoginStatus.error:
        print('## Something went wrong with the login process.\n'
            'Here\'s the error VK gave us: ${result.errorMessage}');
        return false;
    }
  }

  static Future<void> Logout() async => util.vkSignIn.logOut();
}
