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
      width: 220,
      height: 350,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: url != null
            ? Image.network(
                url,
                fit: BoxFit.cover,
              )
            : Text("No image"),
      ),
    );
  }
}
