import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:movie_app/services/movies/concretes/omdb%20api/responses/movie_response.dart';
import 'package:movie_app/services/movies/concretes/omdb%20api/responses/search_movie_response.dart';
import 'package:movie_app/utils/configs/configs.dart';

class OmdbApiMovieService extends MovieService {
  OmdbApiMovieService() {
    Configs().getOmdbEndPoint().then((value) => this.rootUrl=value);
  }

  @override
  Future<List<Movie>> searchMovie(String title) async {
    var url = this.rootUrl + "&type=movie" + "&s=$title";
    var movies = List<Movie>();

    var rawResponse = await makeRequest(url);

    var response = SearchResponse.fromRawJson(rawResponse);

    response.search.forEach((e) {
      movies.add(Movie(
        title: e.title,
        year: int.parse(e.year),
        posterUrl: e.poster,
        imdbId: e.imdbId,
      ));
    });

    movies.sort((a, b) {
      return b.year.compareTo(a.year);
    });

    return movies;
  }

  @override
  Future<Movie> getMovieByImdbId(String imdbId) async {
    var url = this.rootUrl + "&type=movie" + "&i=$imdbId" + "&plot=full";

    var rawResponse = await makeRequest(url);

    var response = MovieResponse.fromRawJson(rawResponse);

    return Movie(
      title: response.title,
      imdbId: response.imdbId,
      year: int.parse(response.year),
      imdbRating: response.imdbRating,
      ratings: response.ratings,
      plot: response.plot,
      actors: response.actors,
      director: response.director,
      genre: response.genre,
      posterUrl: response.poster,
      awards: response.awards,
    );
  }
}
