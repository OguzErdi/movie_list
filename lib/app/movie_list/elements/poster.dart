import 'package:flutter/material.dart';
import 'package:movie_app/app/movie_detail/movie_detail.dart';

class Poster extends StatelessWidget {
  final int index;

  const Poster({
    this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => MovieDetail(index: index)));
      },
      child: Hero(
        tag: index,
        child: Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
