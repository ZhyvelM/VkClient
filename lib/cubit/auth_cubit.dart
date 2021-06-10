import 'package:bloc/bloc.dart';
import 'package:flutter_vk_login/flutter_vk_login.dart';
import 'package:meta/meta.dart';
import 'package:vkontakte/util.dart' as util;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> vkLogin() async {
    final VkLoginResult result = await util.vkSignIn.logIn(['11,294']);
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
        util.init(int.parse(accessToken.userId), accessToken.token);
        emit(Authorised());
        break;
      case VKLoginStatus.cancelledByUser:
        print('## Login cancelled by the user.');
        break;
      case VKLoginStatus.error:
        print('## Something went wrong with the login process.\n'
            'Here\'s the error VK gave us: ${result.errorMessage}');
        break;
    }
  }
}
