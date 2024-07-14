import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  /* Authentication Dependencies */
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  serviceLocator.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  serviceLocator.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  /* Song Dependencies */
  serviceLocator.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImp(),
  );

  serviceLocator.registerSingleton<SongsRepository>(
    SongRepositoryImpl(),
  );

  serviceLocator.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );

  serviceLocator.registerSingleton<GetPlayListUseCase>(
    GetPlayListUseCase(),
  );
}
