import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'elements/buy_ticker_button.dart';
import 'elements/movie_summary.dart';

class MovieList extends StatefulWidget {
  final _viewportFraction = 0.75;
  final double _topMargin = 50.0;

  @override
  _MovieListState createState() => _MovieListState();
  
}

class _MovieListState extends State<MovieList> {
  PageController _controller;
  PageController _backgroundController;

  int _currentPos = 0;
  double _currentOffset= 0;

  _MovieListState(){
    _controller = PageController(viewportFraction: widget._viewportFraction, initialPage: 0);
    _backgroundController = PageController(initialPage: 0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      // print(_controller.offset);
      _currentOffset = _controller.offset * (1 / widget._viewportFraction);

      _backgroundController.jumpTo(_currentOffset);
      // print("_currentOffset: $_currentOffset");
    });

    _backgroundController.addListener(() {
      // print(_backgroundController.offset);
    });
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
                child: PageView.builder(
                    onPageChanged: (pos) {
                      setState(() {
                        // print('_currentPos: $_currentPos');
                        _currentPos = pos;
                        print("_controller offste : ${_controller.offset}");
                      });
                    },
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      bool isCurrentPage = _currentPos == index;
                      // print('topMargin: $topMargin');
                      return AnimatedPadding(
                        duration: Duration(milliseconds: 250),
                        padding: isCurrentPage ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: widget._topMargin),
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 250),
                          opacity: isCurrentPage ? 1.0 : 0.7,
                          child: Container(
                            child: MovieSummary(
                              topMargin: 0,
                            ),
                          ),
                        ),
                      );
                    }),
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
