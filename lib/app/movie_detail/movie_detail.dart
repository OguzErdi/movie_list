import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final int index;

  const MovieDetail({
    this.index,
    Key key,
  }) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.index,
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.red[400],
          child: Text(widget.index.toString()),
        ),
      ),
    );
  }
}
