import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/services/movies/concretes/imdb_api/models/search_response.dart';

class ImdbApiMovieService extends MovieService {
  String rootUrl = 'https://imdb8.p.rapidapi.com';

  @override
  Future getMovie(String imdbId) async {
    var url = "$rootUrl/title/find";

    var responseJson = await generateHttpRequest(url);

    var response = SearchResponse.fromRawJson(responseJson);

    return response.results;
  }

  @override
  Future<List<Movie>> searchMovie(String title) async {
    var url = "$rootUrl/title/find?q=$title";

    var responseJson = await generateHttpRequest(url);

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

    return response.results;
  }

  @override
  Future<List<MovieImage>>  getImages(String imdbId) async {
    var url = "$rootUrl/title/get-images?tconst=$imdbId";

    var responseJson = await generateHttpRequest(url);

    var list = jsonDecode(responseJson) as Map;
    var imagesRaw = list['images'];
    var imagesList = (jsonDecode(imagesRaw) as List).map((e) => MovieImage.fromRawJson(e)).toList();

    return imagesList;
  }

  @override
  Future generateHttpRequest(String url) async {
    var response = await http.get(
      url,
      headers: {
        "x-rapidapi-host": "imdb8.p.rapidapi.com",
        "x-rapidapi-key": "ea847657afmsh2f48705a32c6997p15948fjsn0e178bdd417f",
        "useQueryString": "true",
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          "Not connetct to ImdbApiMovieService. Error: ${response.statusCode}");
    }
  }
}
