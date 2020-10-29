import 'package:flutter/material.dart';

class Spin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(
          Colors.pink,
        ),
      )
    );
  }
}
