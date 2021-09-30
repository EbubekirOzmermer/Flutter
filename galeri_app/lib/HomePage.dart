import 'package:carousel_slider/carousel_slider.dart';
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
            /*Center(
              child: CarouselSlider.builder(
                  itemBuilder: (context, index, realIndex) {
                    final image = images[index];

                    return buildImage(image, index);
                  },
                  itemCount: images.length,
                  options: CarouselOptions(height: 400)),
            ), */

            Expanded(
              child: buildGridView(),
              /*child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: _imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.file(
                        File(_imageList[index].path),
                        fit: BoxFit.cover,
                      ),
                    );
                  }), */
            ),
            Spacer(),
            Container(
              child: (Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      //loadAssets();
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
    /*final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
    }
    setState(() {}); */
  }

  /*Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        selectedAssets: images,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }  */

  Widget buildImage(String image, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );
}
