import 'package:flutter/material.dart';

import 'movie_detail/movie_detail.dart';
import 'movie_list/movie_list.dart';

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.tv),
      //       onPressed: () {},
      //       color: Colors.white,
      //     )
      //   ],
      // ),
      body: MovieList(),
    );
  }
}
