import 'package:flutter/material.dart';

void main() {
  runApp(new WechatApp(Islogin: false));
}

class WechatApp extends StatefulWidget {
  WechatApp({this.Islogin});
  final bool Islogin;
  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return new Wechat();
    }
}


class Wechat extends State<WechatApp>{
  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        title: "Kakashi",
        theme: new ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[100],
          accentColor: Colors.lightGreen[100]
        ),
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("copy wechat"),
          ),
        ),
      );
  }
}
