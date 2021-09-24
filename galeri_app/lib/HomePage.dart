import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galeri_app/Login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*PageController _pageController = PageController();
  List<Widget> _screens = [AlbumPage(), AddPage()];
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
 
  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }
  */

  Future<void> logout() async {
    var sp = await SharedPreferences.getInstance();

    sp.remove("UserName");
    sp.remove("Password");

    Navigator.pushReplacement(
        this.context, MaterialPageRoute(builder: (context) => Login()));
  }

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Row(
                  children: [
                    image != null
                        ? Image.file(
                            image!,
                            width: screenWidth / 4,
                            height: screenHeight / 5,
                          )
                        : Text("")
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              child: (Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.album),
                    color: Colors.green,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      pickImage(ImageSource.camera);
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        logout();
                      },
                      icon: Icon(Icons.exit_to_app)),
                  Spacer(),
                ],
              )),
            ),
            SizedBox(
              width: 1,
              height: 10,
            )
          ],
        ),
      ),

      /*PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.album),
                ),
                label: "Albüm",
                backgroundColor: Colors.black26),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  icon: Icon(Icons.add_a_photo),
                ),
                label: "Ekle",
                backgroundColor: Colors.black26),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    logout();
                  },
                  icon: Icon(Icons.exit_to_app),
                ),
                label: "Çıkış",
                backgroundColor: Colors.black26),
          ],
          onTap: _onItemTapped), */
    );
  }
}
