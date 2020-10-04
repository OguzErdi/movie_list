import 'package:flutter/material.dart';
import 'package:movie_app/services/movies/concretes/omdb%20api/responses/movie_response.dart';

import '../screens/movie_list/widgets/../../../widgets/rating_score.dart';

class RatingContainer extends StatelessWidget {
  final List<Rating> ratings;
  
  const RatingContainer({
    this.ratings,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ratings.map((e) => RatingScore(rating: e)).toList(),
    );
  }
}



