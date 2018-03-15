import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "交互事例",
    home: new Counter(),
  ));
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  void _incrCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("flutter 交互"),
      ),
      body: new Center(
        child: new Text('按钮点击 $counter 次${ counter == 0 ? '' : '' }'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrCounter,
        tooltip: "增加",
        child: new Icon(Icons.add),
      ),
    );
  }
}
