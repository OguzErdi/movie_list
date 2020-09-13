import 'dart:convert';

import 'package:flutter/cupertino.dart';

class MovieServiceFromFile {
  final BuildContext context;

  MovieServiceFromFile(this.context) {}

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

  Future getMoviesAsync() async {
    var movieJson = await DefaultAssetBundle.of(context).loadString("assets/data/movies.json");
    List movies = json.decode(movieJson);

    return movies;
  }
}
