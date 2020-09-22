
import 'package:get_it/get_it.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:movie_app/services/movies/concretes/imdb_api/imdb_api_movie_service.dart';


GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<MovieService>(() => ImdbApiMovieService());
}