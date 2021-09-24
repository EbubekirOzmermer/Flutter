import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FotoIslem extends StatelessWidget {
  const FotoIslem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FotoIslemHome();
  }
}

class FotoIslemHome extends StatefulWidget {
  const FotoIslemHome({Key? key}) : super(key: key);

  @override
  _FotoIslemHomeState createState() => _FotoIslemHomeState();
}

class _FotoIslemHomeState extends State<FotoIslemHome> {
  late File selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                child: Center(),
                radius: 80,
                backgroundImage:
                    selectedFile != null ? FileImage(selectedFile) : null,
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () {
                    showSelectedPhoto(context);
                  },
                  icon: Center())
            ],
          )
        ],
      ),
    );
  }

  void showSelectedPhoto(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Galeri"),
                    onTap: () {
                      loadSelected(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    title: Text("Kamera"),
                    onTap: () {
                      loadSelected(ImageSource.camera);
                    },
                  )
                ],
              ),
            ));
  }

  void loadSelected(ImageSource source) async {
    final picker = ImagePicker();
    final selected = await picker.pickImage(source: source);
    setState(() {
      if (selected != null) {
        selectedFile = File(selected.path);
      }
    });
  }
}
