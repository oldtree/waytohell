import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) {
    return new GestureDetector(
      onTap: () {
        print("my button is clicked");
      },
      child: new Container(
        height: 40.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.blue[500],
        ),
        child: new Center(
          child: new Text("社会"),
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: "手势处理",
    home: new MyButton(),
  ));
}
