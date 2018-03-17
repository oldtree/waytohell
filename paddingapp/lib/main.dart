import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "padding world",
    home: new PaddingWolrd(),
  ));
}

class PaddingWolrd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("padding sample"),
      ),
      body: new Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 100.0, 50.0, 40.0),
        child: new Image.network("http://up.qqjia.com/z/25/tu32710_4.jpg"),
      ),
    );
  }
}
