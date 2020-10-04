import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String text;

  const Badge({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400],
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 11,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
