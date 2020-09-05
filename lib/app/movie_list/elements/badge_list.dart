import 'package:flutter/material.dart';

import 'badge.dart';

class BadgesList extends StatelessWidget {
  const BadgesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(),
            Badge(),
            Badge(),
          ],
        ),
      ),
    );
  }
}
