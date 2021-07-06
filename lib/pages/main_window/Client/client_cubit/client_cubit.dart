import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientInitial());

  Future<void> switchToWall() async {
    emit(toWall());
  }

  Future<void> switchToHub() async {
    emit(toHub());
  }

  Future<void> switchToProfile() async {
    emit(toProfile());
  }
}
