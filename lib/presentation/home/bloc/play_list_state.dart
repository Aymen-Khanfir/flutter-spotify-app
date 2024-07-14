import 'package:spotify/domain/entities/song/song.dart';

abstract class PlayListState {

}

class PlayListLoading extends PlayListState {

}

class PlayListLoaded extends PlayListState {
  // Pass list of song entity that we fetch from firestore
  final List<SongEntity> songs;

  PlayListLoaded({required this.songs});
}

class PlayListLoadFailure extends PlayListState {}