import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("images"),
      ),
      body: new Center(
        child: new Image.network(
          "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg",
          scale: 2.0,
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: "image show up",
    home: new ImageDemo(),
  ));
}
