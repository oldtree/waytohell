import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "one two one",
    home: new ChartPage(),
  ));
}

class ChartPage extends StatefulWidget {
  @override
  ChartPageState createState() => new ChartPageState();
}

class ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("one two one"),
          backgroundColor: Colors.green[100],
        ),
        body: new Center(
          child: new Text("random data is $dataSet"),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.refresh),
          onPressed: ChangeData,
        ));
  }

  final random = new Random();
  int dataSet;

  void ChangeData() {
    setState(() {
      dataSet = random.nextInt(100);
    });
  }
}
