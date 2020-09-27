import 'package:movie_app/services/movies/concretes/imdb_api/models/search_response.dart';

abstract class MovieService {

  Future<List<Movie>> searchMovie(String title);
  Future getMovie(String imdbId);
  Future getImages(String imdbId);

  generateHttpRequest(String url);
}