import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> toEdit() {
    emit(ProfileEdit());
  }

  Future<void> toProfile() {
    emit(ProfileInitial());
  }
}
