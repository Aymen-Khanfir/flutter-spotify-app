import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/presentation/home/bloc/play_list_state.dart';
import 'package:spotify/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  // Initializing newsSongLoading as an initial state
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    // Calling The getPlayListUseCase
    var returnedSongs = await serviceLocator<GetPlayListUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(PlayListLoadFailure());
      },
      (data) {
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}
