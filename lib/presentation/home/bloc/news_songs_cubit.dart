import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  // Initializing newsSongLoading as an initial state
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    // Calling The getNewsSongsUseCase
    var returnedSongs = await serviceLocator<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (data) {
        emit(NewsSongsLoaded(songs: data));
      },
    );
  }
}
