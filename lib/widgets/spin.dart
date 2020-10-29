import 'package:flutter/material.dart';

class Spin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.indigo[800],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation(
                Colors.pink,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "MOV APP",
              style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
