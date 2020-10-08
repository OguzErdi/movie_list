import 'package:flutter/material.dart';

class DirectorText extends StatelessWidget {
  final String text;

  const DirectorText({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Director / $text",
      style: TextStyle(fontSize: 14),
    );
  }
}
