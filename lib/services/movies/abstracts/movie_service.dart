
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/rest_api_service.dart';

abstract class MovieService extends RestApiService {
  
  Future<List<Movie>> searchMovie(String title);
  Future<Movie> getMovieByImdbId(String imdbId);
  
}