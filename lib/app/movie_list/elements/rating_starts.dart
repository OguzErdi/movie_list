import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            size: 18,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}