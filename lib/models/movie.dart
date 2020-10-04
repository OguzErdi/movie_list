
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
  });

  Movie copyWith({
    String imdbId,
    String posterUrl,
    String title,
    int year,
    String imdbRating,
    String actors,
    String director,
    String genre,
    String plot,
    String awards,
  }) {
    return Movie(
      imdbId: imdbId ?? this.imdbId,
      posterUrl: posterUrl ?? this.posterUrl,
      title: title ?? this.title,
      year: year ?? this.year,
      imdbRating: imdbRating ?? this.imdbRating,
      actors: actors ?? this.actors,
      director: director ?? this.director,
      genre: genre ?? this.genre,
      plot: plot ?? this.plot,
      awards: awards ?? this.awards,
    );
  }

  @override
  String toString() {
    return 'Movie(imdbId: $imdbId, posterUrl: $posterUrl, title: $title, year: $year, imdbRating: $imdbRating, actors: $actors, director: $director, genre: $genre, plot: $plot, awards: $awards)';
  }
}
