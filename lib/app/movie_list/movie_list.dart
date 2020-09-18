import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/service/movie_from_file_service.dart';

import 'elements/buy_ticket_button.dart';
import 'elements/movie_summary.dart';

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
  List movies;

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

    // MovieServiceFromFile(context)
    //     .getMoviesAsync()
    //     .then((value) => movies = value);
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
            future: MovieFromFileService(context).getMoviesWithFuture(),
            builder: (context, value) {

              if (!value.hasData) {
                return Center(
                  child: Text("No Data"),
                );
              }

              // movies = value.data;
              List movies = json.decode(value.data);
              return Stack(
                children: [
                  PageView.builder(
                      pageSnapping: false,
                      reverse: true,
                      itemCount: movies.length,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _backgroundController,
                      itemBuilder: (context, index) {
                        return Container(
                          color: index % 2 == 0 ? Colors.teal : Colors.amber,
                        );
                      }),
                  Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 9,
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification:
                              (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return;
                          },
                          child: PageView.builder(
                              onPageChanged: (pos) {
                                setState(() {
                                  _currentPos = pos;
                                });
                              },
                              controller: _controller,
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
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
                                    child: Container(
                                      child: MovieSummary(index: index),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: BuyTicketButton(),
                  ),
                ],
              );
            }));
  }
}
