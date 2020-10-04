import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:movie_app/services/movies/concretes/omdb%20api/responses/search_movie_response.dart';

class OmdbApiMovieService extends MovieService {
  OmdbApiMovieService() {
    this.rootUrl = "http://www.omdbapi.com/?apikey=4714e7";
  }

  @override
  Future<List<Movie>> searchMovie(String title) async {
    var url = this.rootUrl + "&type=movie" + "&s=$title";
    var movies = List<Movie>();

    var rawResponse = await makeRequest(url);

    var response = SearchResponse.fromRawJson(rawResponse);

    response.search.forEach((e) {
      movies
          .add(Movie(title: e.title, year: int.parse(e.year), posterUrl: e.poster));
    });

    movies.sort((a, b) {
      return b.year.compareTo(a.year);
    });

    return movies;
  }

  @override
  Future<Movie> getMovie(String imdbId) {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

    @override
  Future getImages(String imdbId) {
    // TODO: implement getImages
    throw UnimplementedError();
  }
}
