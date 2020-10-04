import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail/widgets/actor.dart';

class ActorContianer extends StatelessWidget {
  final List<String> actors;

  const ActorContianer({
    this.actors,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Actors",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.only(top: 20),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(width: 20);
            },
            scrollDirection: Axis.horizontal,
            itemCount: actors.length,
            itemBuilder: (context, index) {
              return Actor(name: actors[index]);
            },
          ),
        )
      ],
    );
  }
}
