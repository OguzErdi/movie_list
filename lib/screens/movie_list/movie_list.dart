import 'package:flutter/material.dart';
import 'package:movie_app/services/locator/service_locator.dart';
import 'package:movie_app/services/movies/abstracts/movie_service.dart';
import 'package:movie_app/services/movies/concretes/imdb_api/models/search_response.dart';
import 'package:movie_app/widgets/buy_ticket_button.dart';
import 'package:movie_app/screens/movie_list/widgets/movie_summary.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _viewportFraction = 0.75;
  final double _topMargin = 50.0;

  PageController _controller;
  PageController _backgroundController;
  int _currentPos = 0;
  double _currentOffset = 0;
  MovieService _movieService;
  List<Movie> _movies;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      viewportFraction: _viewportFraction,
      initialPage: 0,
    );
    _backgroundController = PageController(
      initialPage: 0,
    );

    _controller.addListener(() {
      _currentOffset = _controller.offset * (1 / _viewportFraction);
      _backgroundController.jumpTo(_currentOffset);
    });

    _movieService = locator<MovieService>();
  }

  @override
  void dispose() {
    _controller.dispose();
    _backgroundController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: _movieService.searchMovie("galaxy"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("No Data");
          }

          _movies = snapshot.data;
          return Stack(
            children: [
              PageView.builder(
                  pageSnapping: false,
                  reverse: true,
                  itemCount: _movies.length,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _backgroundController,
                  itemBuilder: (context, index) {
                    return Image.network(
                      _movies[index].image.url,
                      fit: BoxFit.cover,
                    );
                  }),
              Align(
                alignment: Alignment.bottomCenter,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: SizedBox(
                    height: 500,
                    child: PageView.builder(
                      onPageChanged: (pos) {
                        setState(() {
                          _currentPos = pos;
                        });
                      },
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: _movies.length,
                      itemBuilder: (context, index) {
                        bool isCurrentPage = _currentPos == index;

                        return AnimatedPadding(
                          duration: Duration(milliseconds: 200),
                          padding: isCurrentPage
                              ? EdgeInsets.only(top: 0)
                              : EdgeInsets.only(top: _topMargin),
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: isCurrentPage ? 1.0 : 0.7,
                            child: MovieSummary(movie: _movies[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: BuyTicketButton(),
              ),
            ],
          );
        },
      ),
    );
  }
}
