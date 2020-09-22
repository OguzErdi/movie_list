import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';
import 'package:movie_app/services/movies/concretes/imdb_api/models/search_response.dart';

import '../../../widgets/badge_container.dart';
import '../../../widgets/icon_more.dart';
import '../../../widgets/movie_title.dart';
import 'poster.dart';
import 'rating_container.dart';

class MovieSummary extends StatelessWidget {
  final Movie movie;

  const MovieSummary({
    this.movie,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (dragUpdateDetails) {
        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
        if (dragUpdateDetails.delta.dy < -5) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetail(imdbId: movie.id)));
        }
        print(dragUpdateDetails.delta.dy);
      },
      child: Hero(
        tag: movie.id,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Poster(url: movie.image?.url),
                  MovieTitle(title: movie.title),
                  BadgeContainer(),
                  RatingContainer(),
                  IconMore(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
