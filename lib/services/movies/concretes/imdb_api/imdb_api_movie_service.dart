import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/services/movies/concretes/imdb_api/models/search_response.dart';

class ImdbApiMovieService extends MovieService {
  @override
  Future getMovie(String imdbId) async {
    var url = "https://imdb8.p.rapidapi.com/title/find";

    var responseJson = await generateHttpRequest(url);

    var response = SearchResponse.fromRawJson(responseJson);

    return response.results;
  }

  @override
  Future<List<Movie>> searchMovie(String title) async {
    var url = "https://imdb8.p.rapidapi.com/title/find?q=$title";

    var responseJson = await generateHttpRequest(url);

    var response = SearchResponse.fromRawJson(responseJson);

    response.results.sort((a, b) {
      if (a.year != null && b.year != null) {
        return a.year.compareTo(b.year);
      } else {
        return -1;
      }
    });

    return response.results;
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
