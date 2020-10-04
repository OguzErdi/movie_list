import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_detail/widgets/director_text.dart';
import 'package:movie_app/screens/movie_detail/widgets/introduction.dart';
import 'package:movie_app/widgets/badge_container.dart';
import 'package:movie_app/widgets/movie_title.dart';
import 'package:movie_app/screens/movie_list/widgets/rating_container.dart';

import 'Widgets/actor_container.dart';

class MovieDetail extends StatefulWidget {
  final String imdbId;

  const MovieDetail({
    this.imdbId,
    Key key,
  }) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Movie _movie;

  @override
  void initState() {
    super.initState();

    _movie = Movie();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.imdbId,
      child: Material(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              width: double.infinity,
              height: double.infinity,
              image: NetworkImage(_movie.posterUrl),
              fit: BoxFit.contain,
            ),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: DraggableScrollableSheet(
                  maxChildSize: 0.75,
                  minChildSize: 0.2,
                  builder: (context, scrollController) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      //must be a scrollable widget. it can be Listview
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: scrollController,
                        child: Column(
                          children: [
                            MovieTitle(),
                            BadgeContainer(),
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
