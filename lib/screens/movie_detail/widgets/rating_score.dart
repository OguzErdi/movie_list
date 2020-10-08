import 'package:flutter/material.dart';
import 'package:movie_app/services/movies/concretes/omdb%20api/responses/movie_response.dart';

class RatingScore extends StatelessWidget {
  final Rating rating;

  const RatingScore({
    this.rating,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Column(
        children: [
          Text(
            rating.value,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.grey[600],
            ),
          ),
          Text(
            rating.source,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
