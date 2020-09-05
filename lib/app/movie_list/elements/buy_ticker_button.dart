import 'package:flutter/material.dart';

class BuyTicketButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: ButtonTheme(
        minWidth: 230,
        height: 50,
        child: RaisedButton(
          color: Colors.grey[850],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: Text(
            "BUT TICKET",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
