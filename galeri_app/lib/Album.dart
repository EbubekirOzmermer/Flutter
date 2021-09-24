import 'dart:io';
import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final List<File> images;
  const AlbumPage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: images
            .map((imageTemporary) =>
                Image.file(imageTemporary, fit: BoxFit.cover))
            .toList(),
      ),
    );
  }
}
