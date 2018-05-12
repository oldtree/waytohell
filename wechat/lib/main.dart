import 'package:flutter/material.dart';
import 'package:wechat/function/auth/login.dart';
import 'package:wechat/models/auth.dart';
import 'package:wechat/function/entrypoint.dart';
import 'package:wechat/function/chat/chat.dart';


void main() {
  LoginInfo u = new LoginInfo();
  runApp(new WechatApp(user:u));
}

class WechatApp extends StatefulWidget {
  LoginInfo user;
  WechatApp({this.user});
  static bool Islogin;
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
          body: new Container(
            child: GetLoginScaffold(widget.user)
          ),
        ),
        routes: <String,WidgetBuilder>{
          '/login':(BuildContext context){return GetLoginScaffold(widget.user);},
          '/about':(BuildContext context){return new AboutDialog();},
          '/entrypoint':(BuildContext context){return GetMainEntryScaffold(true);},
          '/wechat':(BuildContext context){return new Chat();}
        },
      );
  }
}
