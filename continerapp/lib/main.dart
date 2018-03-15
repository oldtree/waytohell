import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "continer",
    home: new ContainerApp(),
  ));
}

class ContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        width: 100.0,
        height: 100.0,
        color: Colors.greenAccent,
        decoration: new BoxDecoration(
          color: Colors.lightBlue[100],
        ),
      ),
    );
  }
}
