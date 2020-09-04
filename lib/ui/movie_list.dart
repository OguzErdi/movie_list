import 'package:flutter/material.dart';

class MovieLis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView(
            children: [
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.teal,
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                flex: 9,
                child: Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(top: 20, left: 20),
                            padding: EdgeInsets.only(top: 30),
                            width: 270,
                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 200,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 8,
                                  ),
                                  child: Text(
                                    "Joker",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.grey[850],
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 200,
                                    alignment: Alignment.center,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Badge(),
                                          Badge(),
                                          Badge(),
                                          Badge(),
                                          Badge(),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          );
                        })),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400],
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Text(
        "Action",
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 9,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
