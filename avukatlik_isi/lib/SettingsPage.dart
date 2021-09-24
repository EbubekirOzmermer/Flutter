import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<bool> isSelected = [false, false, false];
  List<bool> isSelected1 = [false, false, false];
  List<bool> isSelected2 = [false, false];

  @override
  Widget build(BuildContext context) {
    /*var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width; */
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Çağrı",
                        style: TextStyle(color: Colors.red[400]),
                      ),
                      Spacer(),
                      ToggleButtons(
                        renderBorder: false,
                        isSelected: isSelected,
                        selectedColor: Colors.white,
                        fillColor: Colors.grey[350],
                        children: [
                          SizedBox(
                            width: 75,
                            height: 50,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.people,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Herkes",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.low_priority_sharp,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Avukatlar",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.person_off_outlined,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Hiç Kimse",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          )
                        ],

                        //borderRadius: BorderRadius.circular(8),
                        onPressed: (int newIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == newIndex) {
                                isSelected[index] = !isSelected[index];
                              } else {
                                isSelected[index] = false;
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Mesaj",
                        style: TextStyle(color: Colors.red[400]),
                      ),
                      Spacer(),
                      ToggleButtons(
                        renderBorder: false,
                        isSelected: isSelected1,
                        selectedColor: Colors.white,
                        fillColor: Colors.grey[350],
                        children: [
                          SizedBox(
                            width: 75,
                            height: 50,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.people,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Herkes",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.low_priority_sharp,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Avukatlar",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.person_off_outlined,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Hiç Kimse",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          )
                        ],
                        onPressed: (int newIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected1.length;
                                index++) {
                              if (index == newIndex) {
                                isSelected1[index] = !isSelected1[index];
                              } else {
                                isSelected1[index] = false;
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 15.0),
                  child: Row(
                    children: [
                      Text(
                        "Bildirim",
                        style: TextStyle(color: Colors.red[400]),
                      ),
                      Spacer(),
                      ToggleButtons(
                        renderBorder: false,
                        isSelected: isSelected2,
                        selectedColor: Colors.white,
                        fillColor: Colors.grey[350],
                        children: [
                          SizedBox(
                            width: 75,
                            height: 50,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.check,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Açık",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: Column(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.close,
                                  color: Colors.red[300],
                                ),
                                Spacer(),
                                Text("Kapalı",
                                    style: TextStyle(color: Colors.red[400])),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                        onPressed: (int newIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected2.length;
                                index++) {
                              if (index == newIndex) {
                                isSelected2[index] = !isSelected2[index];
                              } else {
                                isSelected2[index] = false;
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
