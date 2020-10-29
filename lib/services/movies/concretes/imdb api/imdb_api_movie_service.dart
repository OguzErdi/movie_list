import 'dart:convert';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/services/movies/concretes/imdb api/responses/search_response.dart';

class ImdbApiMovieService extends MovieService {
  
  ImdbApiMovieService(){
    this.rootUrl = 'https://imdb8.p.rapidapi.com';
  }

  @override
  Future<List<Movie>> searchMovie(String title) async {
    var url = "${this.rootUrl}/title/find?q=$title";

    var responseJson = await makeRequest(url);

    var response = SearchResponse.fromRawJson(responseJson);

    response.results.sort((a, b) {
      if (a.year != null && b.year != null) {
        return a.year.compareTo(b.year);
      } else {
        return -1;
      }
    });

    response.results = response.results.reversed.toList();

    response.results = response.results
        .where((x) =>
            (x.image?.url?.isNotEmpty ?? false) &&
            (x.titleType == ResultTitleType.MOVIE))
        .toList();

    // return response.results;
    return List<Movie>();
  }

  @override
  Future<List<MovieImage>>  getImages(String imdbId) async {
    var url = "$rootUrl/title/get-images?tconst=$imdbId";

    var responseJson = await makeRequest(url);

    var list = jsonDecode(responseJson) as Map;
    var imagesRaw = list['images'];
    var imagesList = (jsonDecode(imagesRaw) as List).map((e) => MovieImage.fromRawJson(e)).toList();

    return imagesList;
  }

  @override
  Future<Movie> getMovieByImdbId(String imdbId) {
    // doesn't implemented becouse of api limit :(.
    throw UnimplementedError();
  }

  @override
  Future<http.Response> sendGetRequest(String url) async {
    var response = await http.get(
      url,
      headers: {
        "x-rapidapi-host": "imdb8.p.rapidapi.com",
        "x-rapidapi-key": "ea847657afmsh2f48705a32c6997p15948fjsn0e178bdd417f",
        "useQueryString": "true",
      },
    );
    return response;
  }
}
