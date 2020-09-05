import 'package:flutter/material.dart';

class RatingScore extends StatelessWidget {
  const RatingScore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Text(
        "9.0",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
