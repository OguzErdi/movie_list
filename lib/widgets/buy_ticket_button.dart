import 'package:flutter/material.dart';

class MovieButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: ButtonTheme(
        minWidth: 230,
        height: 50,
        child: RaisedButton(
          color: Colors.grey[850],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: Text(
            "ADD TO LIST",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
