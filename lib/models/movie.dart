import 'dart:convert';

class Movie {
  String imdbId;
  String posterUrl;
  String title;
  int year;
  double imdbRating;
  Movie({
    this.imdbId,
    this.posterUrl,
    this.title,
    this.year,
    this.imdbRating,
  });

  Movie copyWith({
    String imdbId,
    String posterUrl,
    String title,
    int year,
    double imdbRating,
  }) {
    return Movie(
      imdbId: imdbId ?? this.imdbId,
      posterUrl: posterUrl ?? this.posterUrl,
      title: title ?? this.title,
      year: year ?? this.year,
      imdbRating: imdbRating ?? this.imdbRating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imdbId': imdbId,
      'posterUrl': posterUrl,
      'title': title,
      'year': year,
      'imdbRating': imdbRating,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Movie(
      imdbId: map['imdbId'],
      posterUrl: map['posterUrl'],
      title: map['title'],
      year: map['year'],
      imdbRating: map['imdbRating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(imdbId: $imdbId, posterUrl: $posterUrl, title: $title, year: $year, imdbRating: $imdbRating)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Movie &&
      o.imdbId == imdbId &&
      o.posterUrl == posterUrl &&
      o.title == title &&
      o.year == year &&
      o.imdbRating == imdbRating;
  }

  @override
  int get hashCode {
    return imdbId.hashCode ^
      posterUrl.hashCode ^
      title.hashCode ^
      year.hashCode ^
      imdbRating.hashCode;
  }
}
