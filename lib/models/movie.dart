import 'package:movie_app/services/movies/concretes/omdb%20api/responses/movie_response.dart';

class Movie {
  String imdbId;
  String posterUrl;
  String title;
  int year;
  String imdbRating;
  String actors;
  String director;
  String genre;
  String plot;
  String awards;
  List<Rating> ratings;
  Movie({
    this.imdbId,
    this.posterUrl,
    this.title,
    this.year,
    this.imdbRating,
    this.actors,
    this.director,
    this.genre,
    this.plot,
    this.awards,
    this.ratings,
  });


  @override
  String toString() {
    return 'Movie(imdbId: $imdbId, posterUrl: $posterUrl, title: $title, year: $year, imdbRating: $imdbRating, actors: $actors, director: $director, genre: $genre, plot: $plot, awards: $awards, raitrings: $ratings)';
  }
}
