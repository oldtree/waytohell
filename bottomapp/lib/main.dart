import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "bottom up",
      home: new BottomSample(),
    ));

class BottomSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("bottom setup"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("show bottom"),
          onPressed: () {
            showModalBottomSheet<Null>(
                context: context,
                builder: (BuildContext context) {
                  return new Container(
                    child: new Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: new Text('这是模态底部面板，点击任意位置即可关闭',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 24.0))),
                  );
                });
          },
        ),
      ),
    );
  }
}
