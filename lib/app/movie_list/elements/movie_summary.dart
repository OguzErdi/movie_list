import 'package:flutter/material.dart';

import 'badge_list.dart';
import 'buy_ticker_button.dart';
import 'icon_more.dart';
import 'movie_title.dart';
import 'poster.dart';
import 'rating_container.dart';

class MovieSummary extends StatelessWidget {
  final double topMargin;

  const MovieSummary({
    this.topMargin,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
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
              Poster(),
              MovieTitle(),
              BadgesList(),
              RatingContainer(),
              IconMore(),
            ],
          ),
        ),
      ),
    );
  }
}
