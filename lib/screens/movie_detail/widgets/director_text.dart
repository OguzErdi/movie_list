import 'package:flutter/material.dart';

class DirectorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "Director: Todd Philips",
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
