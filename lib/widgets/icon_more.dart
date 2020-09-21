import 'package:flutter/material.dart';

class IconMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.lens,
            size: 6,
            color: Colors.grey[850],
          ),
          Icon(
            Icons.lens,
            size: 6,
            color: Colors.grey[850],
          ),
          Icon(
            Icons.lens,
            size: 6,
            color: Colors.grey[850],
          ),
        ],
      ),
    );
  }
}
