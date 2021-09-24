import 'package:flutter/material.dart';

class CommentsMade extends StatefulWidget {
  const CommentsMade({Key? key}) : super(key: key);

  @override
  _CommentsMadeState createState() => _CommentsMadeState();
}

class _CommentsMadeState extends State<CommentsMade> {
  List<bool> isSelected = [true, false, false];
  Color buton = Colors.black54;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied_outlined,
            color: Color(0xFFFD9515c),
            size: 75,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Yorum Yapılmamış",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          /*IconButton(
            icon: Icon(Icons.favorite),
            color: buton,
            tooltip: 'Add to favorite',
            onPressed: () {
              setState(() {
                if (buton == Colors.black54) {
                  print("object1");
                  buton = Colors.red;
                } else {
                  buton = Colors.black54;
                  print("object2");
                }
              });
            },
          ), */
        ],
      ),
    );
  }
}
