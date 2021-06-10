import 'package:bloc/bloc.dart';
import 'package:flutter_vk_sdk/flutter_vk_sdk.dart';
import 'package:flutter_vk_sdk/vk_scope.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> vkLogin() async {
    FlutterVKSdk.login(
      scope:
          '${VKScope.wall}, ${VKScope.photos}, ${VKScope.video}, ${VKScope.audio}, ${VKScope.stats}, ${VKScope.friends}, ${VKScope.notes}',
      onSuccess: (res) {
        print("## Logedin");
        emit(Authorised());
      },
      onError: (error) {
        print('## LOGIN ERROR: $error}');
      },
    );
  }
}
