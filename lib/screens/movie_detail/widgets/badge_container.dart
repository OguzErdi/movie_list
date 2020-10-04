import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail/widgets/badge.dart';

class BadgeContainer extends StatelessWidget {
  final List<String> badgeList;

  const BadgeContainer({
    this.badgeList,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Wrap(
        children: badgeList
            .map((e) => Badge(
                  text: e,
                ))
            .toList(),
      ),
    );
  }
}
