import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final String title;

  const MovieTitle({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        title != null ? title : "No title",
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
