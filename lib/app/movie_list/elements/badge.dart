import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
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
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400],
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Text(
        "Action",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 9,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}