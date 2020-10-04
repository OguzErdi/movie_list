import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class RestApiService {
  String rootUrl;

  Future makeRequest(String url) async {
    try {
      if (rootUrl.isEmpty) {
        throw Exception(
            "Service rootUrl doesn't set. Please set the rootUrl field in the constructer.");
      }

      var response = await sendGetRequest(url);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception(
            "Not connetct to ImdbApiMovieService. Error: ${response.statusCode}");
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  
  sendGetRequest(String url) async {
    var response = await http.get(
      url,
    );

    return response;
  }
}
