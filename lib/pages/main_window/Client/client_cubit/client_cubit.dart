import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientInitial());

  Future<void> switchToWall() {
    emit(toWall());
  }

  Future<void> switchToHub() {
    emit(toHub());
  }

  Future<void> switchToProfile() {
    emit(toProfile());
  }
}
