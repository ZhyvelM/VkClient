import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vkontakte/service/Authentication.dart';
import 'package:vkontakte/util.dart' as util;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> vkLogin() async {
    await Authentication.Login() ? emit(Authorised()): print("## Auth error");
  }

  Future<void> vkLogout() async {
    Authentication.Logout();
    emit(AuthInitial());
    print('## Logout');
  }
}
