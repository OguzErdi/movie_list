import 'package:flutter/material.dart';

import 'rating_score.dart';
import 'rating_starts.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingScore(),
          RatingStars(),
        ],
      ),
    );
  }
}



