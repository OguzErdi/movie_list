import 'package:flutter/material.dart';
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
      child: Stack(
        children: [
          PageView.builder(
              pageSnapping: false,
              reverse: true,
              itemCount: 15,
              physics: NeverScrollableScrollPhysics(),
              controller: _backgroundController,
              itemBuilder: (context, index) {
                return Container(
                  color: index % 2 == 0 ? Colors.teal : Colors.amber,
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
                    itemCount: 15,
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
                          child: MovieSummary(index: index),
                        ),
                      );
                    }),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: BuyTicketButton(),
          ),
        ],
      ),
    );
  }
}
