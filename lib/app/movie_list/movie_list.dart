import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'elements/buy_ticker_button.dart';
import 'elements/movie_summary.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _controller = PageController(viewportFraction: 0.75, initialPage: 0);

  int _currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView.builder(itemBuilder: (context, index) {
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
                        print('_currentPos: $_currentPos');
                        _currentPos = pos;
                      });
                    },
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final double topMargin = _currentPos == index ? 0 : 50;
                      print('topMargin: $topMargin');
                      return MovieSummary(
                        topMargin: topMargin,
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
