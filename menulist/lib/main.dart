import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "menulist",
      home: new MenusDemo(),
    ));

class MenusDemo extends StatefulWidget {
  @override
  _MenusDemoState createState() {
    return new _MenusDemoState();
  }
}

class _MenusDemoState extends State<MenusDemo> {
  String info = "app create state";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("shadow fight"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          new PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                info = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                    value: "number 1",
                    child: new Text("version 1"),
                  ),
                  new PopupMenuItem<String>(
                    value: "number 2",
                    child: new Text("version 2"),
                  )
                ],
          ),
        ],
      ),
      body: new Center(
        child: new Text(info),
      ),
    );
  }
}
