import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hub_state.dart';

class HubCubit extends Cubit<HubState> {
  HubCubit() : super(HubInitial());

  Future<void> goToPhotos() async {
    emit(PhotosState());
  }

  Future<void> goToMusic() async {
    emit(MusicState());
  }

  Future<void> goToVideos() async {
    emit(VideosState());
  }

  Future<void> goToNotes() async {
    emit(NotesState());
  }

  Future<void> goToAlbum(String albumId) async {
    emit(AlbumState(albumId));
  }

  Future<void> goToHub() async {
    emit(HubInitial());
  }
}
