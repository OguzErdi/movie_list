import 'package:flutter/material.dart';

class ImdbRatingStars extends StatelessWidget {
  final double ratio;

  const ImdbRatingStars({
    this.ratio,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _starCount = ratio.round();
    var starList =
        List<bool>.generate(5, (index) => index < _starCount);

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: starList
            .map((e) => Icon(
                  e ? Icons.star : Icons.star_border,
                  size: 18,
                  color: Colors.amber,
                ))
            .toList(),
      ),
    );
  }
}
