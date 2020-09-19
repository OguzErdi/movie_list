import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/movie.dart';

class MovieFromFileService {
  final BuildContext context;

  MovieFromFileService(this.context);

  //dont wait and return future immediatly
  getMoviesWithFuture() {
    Future<String> movieJson =
        DefaultAssetBundle.of(context).loadString("assets/data/movies.json");
    return movieJson;
    
    // movieJson.then((value) {
    //   // debugPrint("json string: $value");
    //   List movies = json.decode(value);
    //   debugPrint("movies list length: ${movies.length.toString()}");

    //   movies.forEach((element) {
    //     //to get element use key values in square braces if a dynamic list 
    //     debugPrint(element['director']['name']);
    //   });

    //   return movies;
    // });
  }

  //wait future call completed
  //async methods should return Future
  Future getMoviesAsync() async {
    var movieJson = await DefaultAssetBundle.of(context).loadString("assets/data/movies.json");
    //can get as Map object without creating object
    // Map<String, dynamic> movies = json.decode(movieJson);
    List movies = json.decode(movieJson);

    return movies;
  }

  //get complex object from json 
  List<Movie> getMoviesFromJson(String moviesJson) {
    return (json.decode(moviesJson) as List).map((item) => Movie.fromJson(item)).toList();
  }
}
