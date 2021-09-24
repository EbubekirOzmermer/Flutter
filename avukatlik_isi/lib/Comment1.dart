import 'package:flutter/material.dart';

class Comment1 extends StatefulWidget {
  const Comment1({Key? key}) : super(key: key);

  @override
  _Comment1State createState() => _Comment1State();
}

class _Comment1State extends State<Comment1> {
  @override
  Widget build(BuildContext context) {
    Color buton1 = Colors.black54;
    Color buton2 = Colors.black54;
    Color buton3 = Colors.black54;
    Color buton4 = Colors.black54;
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Container(
      width: 70.0,
      height: 45.0,
      decoration: BoxDecoration(
        //color: Color(0xFFFbc4b4f),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) => StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Center(
                          child: Text(
                            "Soru ve önerilerinizi bize yazın ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      content: SizedBox(
                        height: screenHeight / 3.5,
                        width: screenWidth - 16,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, top: 10.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Spacer(),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.sentiment_dissatisfied_outlined,
                                        color: buton1,
                                        size: 42,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (buton1 == Colors.black54) {
                                            buton1 = Colors.red;
                                          } else {
                                            buton1 = Colors.black54;
                                          }
                                        });
                                      },
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.sentiment_dissatisfied,
                                        color: buton2,
                                        size: 42,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (buton2 == Colors.black54) {
                                            buton2 = Colors.yellow;
                                          } else {
                                            buton2 = Colors.black54;
                                          }
                                        });
                                      },
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.emoji_emotions_outlined,
                                        color: buton3,
                                        size: 42,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (buton3 == Colors.black54) {
                                            buton3 = Colors.lightGreen;
                                          } else {
                                            buton3 = Colors.black54;
                                          }
                                        });
                                      },
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.emoji_emotions_outlined,
                                        color: buton4,
                                        size: 42,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (buton4 == Colors.black54) {
                                            buton4 = Colors.green;
                                          } else {
                                            buton4 = Colors.black54;
                                          }
                                        });
                                      },
                                    ),
                                    Spacer(),
                                    Spacer(),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8)),
                                    width: screenWidth - 16,
                                    height: screenHeight / 10,
                                    child: Center(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Colors.green,
                                          filled: true,
                                          hintText: "Bir şeyler yazın",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: screenWidth / 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Gönder",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
        },
        icon: Icon(Icons.message_outlined),
      ),
    );
  }
}
