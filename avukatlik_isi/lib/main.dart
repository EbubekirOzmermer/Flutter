import 'dart:io';

import 'package:avukatlik_isi/BottomBar.dart';
import 'package:avukatlik_isi/Comment1.dart';
import 'package:avukatlik_isi/MoneyPage.dart';
import 'package:avukatlik_isi/CommentsMade.dart';
import 'package:avukatlik_isi/SettingsPage.dart';
import 'package:avukatlik_isi/WarningPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'BottomNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pageList = [CommentsMade(), SettingsPage(), MoneyPage(), WarningPage()];
  late File selectedFile;

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return DefaultTabController(
      length: 4,
      child: Container(
        color: Color(0xFFFD9515c),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            toolbarHeight: 3,
            elevation: 0,
            title: Text(widget.title),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight / 10,
                                width: screenWidth / 5,
                                child: Stack(
                                  fit: StackFit.expand,
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipOval(
                                      child: image != null
                                          ? Image.file(
                                              image!,
                                              width: screenWidth / 8,
                                              height: screenHeight / 10,
                                              fit: BoxFit.cover,
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0, left: 0),
                                              child: Positioned(
                                                right: 5,
                                                left: 0,
                                                bottom: 20,
                                                top: 0,
                                                child: InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder:
                                                          ((builder) =>
                                                              Container(
                                                                height: 100.0,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 20,
                                                                ),
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "Profil Fotoğrafı Seçiniz",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20.0,
                                                                        color: Color(
                                                                            0xFFFD9515c),
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      indent:
                                                                          55,
                                                                      endIndent:
                                                                          55,
                                                                      thickness:
                                                                          2,
                                                                      color: Color(
                                                                          0xFFFD9515c),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: <
                                                                          Widget>[
                                                                        TextButton
                                                                            .icon(
                                                                          icon:
                                                                              Icon(Icons.camera),
                                                                          onPressed:
                                                                              () {
                                                                            pickImage(ImageSource.camera);
                                                                          },
                                                                          label:
                                                                              Text(
                                                                            "Camera",
                                                                            style:
                                                                                TextStyle(color: Color(0xFFFD9515c), fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        TextButton
                                                                            .icon(
                                                                          icon:
                                                                              Icon(Icons.image),
                                                                          onPressed:
                                                                              () {
                                                                            pickImage(ImageSource.gallery);
                                                                          },
                                                                          label:
                                                                              Text(
                                                                            "Galeri",
                                                                            style:
                                                                                TextStyle(color: Color(0xFFFD9515c), fontSize: 18),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.black38,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Admin",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.exit_to_app_rounded,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.person_pin_sharp,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: screenWidth / 1.1,
                        height: screenHeight / 24,
                        child: TextField(
                          decoration: InputDecoration(
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Color(0xFFFbc4b4f),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.person,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.settings,
                          ),
                        ),
                        Tab(
                            icon: Icon(
                          Icons.euro_sharp,
                        )),
                        Tab(
                          icon: Comment1(),
                        ),
                      ],
                      labelColor: Colors.white,
                      indicatorWeight: 1,
                      unselectedLabelColor: Colors.white60,
                    ),
                  ),
                  Container(
                    width: screenWidth - 10,
                    height: screenHeight / 1.67,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Colors.white,
                    ),
                    child: TabBarView(
                      children: [
                        CommentsMade(),
                        SettingBottomBar(),
                        MoneyPage(),
                        Comment1(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: BottomBar1(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
