import 'package:flutter/material.dart';
import 'package:movie_app/app/movie_list/elements/badge_list.dart';
import 'package:movie_app/app/movie_list/elements/movie_title.dart';
import 'package:movie_app/app/movie_list/elements/rating_container.dart';

import 'elements/actor_container.dart';
import 'elements/director_text.dart';
import 'elements/introduction.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image(
              width: double.infinity,
              image: NetworkImage("https://picsum.photos/200/300"),
              fit: BoxFit.contain,
            ),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: DraggableScrollableSheet(
                  maxChildSize: 0.75,
                  builder: (context, scrollController) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            MovieTitle(),
                            BadgesList(),
                            RatingContainer(),
                            DirectorText(),
                            SizedBox(height: 30),
                            ActorContianer(),
                            Introduction(),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
