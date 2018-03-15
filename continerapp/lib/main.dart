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
        width: 400.0,
        height: 400.0,
        //color: Colors.greenAccent,
        decoration: new BoxDecoration(
          color: const Color(0xfffce5cd),
          border: new Border.all(
            color: const Color(0xff6d9eeb),
            width: 8.0,
          ),
        ),
        child: new Text("our home"),
      ),
    );
  }
}
