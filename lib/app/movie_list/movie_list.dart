import 'package:flutter/material.dart';

import 'elements/movie_summary.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView(
            children: [
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.teal,
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                flex: 9,
                child: Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return MovieSummary();
                        })),
              ),
            ],
          ),
        ],
      ),
    );
  }
}