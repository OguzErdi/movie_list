import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_detail/widgets/actor_container.dart';
import 'package:movie_app/screens/movie_detail/widgets/badge_container.dart';
import 'package:movie_app/screens/movie_detail/widgets/director_text.dart';
import 'package:movie_app/screens/movie_detail/widgets/imdb_rating.dart';
import 'package:movie_app/screens/movie_detail/widgets/introduction.dart';
import 'package:movie_app/services/locator/service_locator.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:movie_app/widgets/movie_title.dart';
import 'package:movie_app/screens/movie_detail/widgets/rating_container.dart';
import 'package:movie_app/widgets/panel_divider.dart';
import 'package:movie_app/widgets/spin.dart';

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
  MovieService _movieService;

  @override
  void initState() {
    super.initState();

    _movieService = locator<MovieService>();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.imdbId,
      child: Material(
        child: FutureBuilder(
          future: _movieService.getMovieByImdbId(widget.imdbId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Spin();
            }
            _movie = snapshot.data;

            return Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    width: double.infinity,
                    height: double.infinity,
                    image: NetworkImage(_movie.posterUrl),
                    fit: BoxFit.contain,
                  ),
                ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: DraggableScrollableSheet(
                      maxChildSize: 0.75,
                      initialChildSize: 0.2,
                      minChildSize: 0.1,
                      builder: (context, scrollController) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          //must be a scrollable widget. it can be Listview
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                PanelDivider(),
                                SizedBox(height: 20),
                                MovieTitle(
                                  title: _movie.title,
                                ),
                                SizedBox(height: 10),
                                BadgeContainer(
                                  badgeList: _movie.genre.split(','),
                                ),
                                SizedBox(height: 20),
                                ImdbRating(
                                  score: double.parse(_movie.imdbRating),
                                ),
                                SizedBox(height: 10),
                                DirectorText(text: _movie.director),
                                SizedBox(height: 20),
                                RatingContainer(
                                  ratings: _movie.ratings,
                                ),
                                SizedBox(height: 30),
                                ActorContianer(
                                    actors: _movie.actors.split(',')),
                                Introduction(text: _movie.plot),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}