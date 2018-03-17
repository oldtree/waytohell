import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "stack over flow",
    home: new StackOverFlow(),
  ));
}

class StackOverFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("stack over flow"),
      ),
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new Image.network(
                "http://img2.cxtuku.com/00/13/12/s97783873391.jpg"),
            new Positioned(
              left: 35.0,
              right: 35.0,
              top: 45.0,
              child: new Text(
                "way to hell",
                style: new TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'serif',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
