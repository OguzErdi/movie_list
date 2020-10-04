import 'package:flutter/material.dart';

class Year extends StatelessWidget {
  final String year;

  const Year({
    this.year,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        year,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: Colors.grey[850],
        ),
      ),
    );
  }
}
