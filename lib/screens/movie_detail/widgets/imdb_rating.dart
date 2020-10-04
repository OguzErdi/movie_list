import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail/widgets/imdb_rating_starts.dart';

class ImdbRating extends StatelessWidget {
  final double score;

  const ImdbRating({
    this.score,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          score.toString(),
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.grey[600],
          ),
        ),
        ImdbRatingStars(
          ratio: score / 2,
        ),
      ],
    );
  }
}
