import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        "Joker",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.grey[850],
        ),
      ),
    );
  }
}