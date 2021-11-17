import 'package:flutter/material.dart';
import 'package:galeri_app/Login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];

  Future<void> logout() async {
    var sp = await SharedPreferences.getInstance();

    sp.remove("UserName");
    sp.remove("Password");

    Navigator.pushReplacement(
        this.context, MaterialPageRoute(builder: (context) => Login()));
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 40,
      scrollDirection: Axis.horizontal,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Stack(
            children: [
              AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
              Positioned(
                top: -12,
                right: -12,
                child: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                    ),
                    onPressed: () {
                      setState(() {
                        images.removeAt(index);
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  List<Asset> images = <Asset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resimler"),
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: buildGridView(),
            ),
            Spacer(),
            Container(
              child: (Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      imageToGallery();
                    },
                    icon: Icon(
                      Icons.album,
                      color: Colors.green[900],
                      size: 30,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      imageToCamera();
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.blue[900],
                      size: 30,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        logout();
                      },
                      icon: Icon(
                        Icons.exit_to_app_rounded,
                        color: Colors.red[900],
                        size: 30,
                      )),
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
    );
  }

  void imageToCamera() async {
    final XFile? images = await _picker.pickImage(source: ImageSource.camera);
    if (images!.path.isNotEmpty) {
      _imageList.add(images);
    }
    setState(() {});
  }

  void imageToGallery() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 12,
        selectedAssets: images,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      if (resultList.length >= 1) {
        images = resultList;
      }
    });
  }

  Widget buildImage(String image, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );
}
