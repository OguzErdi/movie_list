import 'package:flutter/material.dart';

import 'elements/buy_ticket_button.dart';
import 'elements/movie_summary.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  PageController _controller;
  PageController _backgroundController;
  final _viewportFraction = 0.75;
  final double _topMargin = 50.0;

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
              itemCount: 5,
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
                child: NotificationListener<OverscrollIndicatorNotification>(
                  // onNotification: (OverscrollIndicatorNotification overscroll) {
                  //   overscroll.disallowGlow();
                  //   return;
                  // },
                  child: PageView.builder(
                      onPageChanged: (pos) {
                        setState(() {
                          _currentPos = pos;
                        });
                      },
                      // physics: BouncingScrollPhysics(),
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
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
      ),
    );
  }
}
