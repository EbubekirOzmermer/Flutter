import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Slider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Image Slider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List urlImages = [
    'https://via.placeholder.com/300.png/09f/fff08',
    'https://via.placeholder.com/200.png/0ff/fff',
    'https://via.placeholder.com/100.png/fff/f00',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/850x150',
    'https://via.placeholder.com/150x550',
    'https://via.placeholder.com/450x650',
    'https://via.placeholder.com/720x1080',
    'https://via.placeholder.com/350x950',
    'https://via.placeholder.com/400.png/762f/ff0',
    'https://via.placeholder.com/350.png/09f0/ff08',
  ];

  int numara = 0;

  late String selectedPhoto;
  late String allPhoto;

  _save() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var response = await Dio().get(selectedPhoto,
          options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
      );
      //print(result);
      //print("akshdjahsd" + url);
    }
  }

  _allSave() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      for (var item in urlImages) {
        var response = await Dio()
            .get(item, options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
        );
        print(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            //Navigator.of(context).pop();
          },
        ),
        title: Text(widget.title),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              var url1 = urlImage;

              //print(urlImages);

              selectedPhoto = url1;

              //print(urlImage);
              numara = index + 1;
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 1.18,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              //disableCenter: true
              //enlargeStrategy: CenterPageEnlargeStrategy.height
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => SizedBox(
        //margin: const EdgeInsets.symmetric(horizontal: 20),
        //color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(numara.toString() + " / ${urlImages.length}"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.22,
              child: GestureDetector(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: const Text("UYARI"),
                            content: const Text(
                                "Galeriye Yüklemek İstiyor musunuz?"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  _allSave();
                                  // ignore: unnecessary_const
                                  const snackBar = const SnackBar(
                                      content: Text(
                                          'Listedeki Tüm Fotoğraflar Galeriye Yüklendi!!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.pop(context);
                                },
                                child: const Text("Tüm Fotoğrafları İndir"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _save();
                                  // ignore: unnecessary_const
                                  const snackBar = const SnackBar(
                                      content: Text(
                                          'Seçili Fotoğraf Galeriye Yüklendi!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.pop(context);
                                },
                                child: const Text("Seçili Fotoğrafı İndir"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Geri Dön"),
                              ),
                            ],
                          ));
                },
                child: Image.network(
                  urlImage,
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
}
