import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String url;

  const Poster({
    this.url,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: url != null ? Image.network(url) : Text("No image"),
    );
  }
}
