import 'package:spotify/domain/entities/song/song.dart';

abstract class NewsSongsState {

}

class NewsSongsLoading extends NewsSongsState {

}

class NewsSongsLoaded extends NewsSongsState {
  // Pass list of song entity that we fetch from firestore
  final List<SongEntity> songs;

  NewsSongsLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewsSongsState {}