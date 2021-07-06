part of 'hub_cubit.dart';

@immutable
abstract class HubState {
  const HubState();
}

class HubInitial extends HubState {
  const HubInitial();
}

class PhotosState extends HubState {
  const PhotosState();
}

class MusicState extends HubState {
  const MusicState();
}

class VideosState extends HubState {
  const VideosState();
}

class AlbumState extends HubState {
  final String albumId;

  AlbumState(this.albumId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumState && runtimeType == other.runtimeType && albumId == other.albumId;

  @override
  int get hashCode => albumId.hashCode;
}

class NotesState extends HubState {
  const NotesState();
}
