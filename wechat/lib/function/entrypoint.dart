import 'package:flutter/material.dart';
import 'package:wechat/models/auth.dart';


Widget GetMainEntryScaffold(bool isLogin){
  return new Scaffold(
    appBar: new AppBar(
      title: new Text(""),
    ),
    body: new EntryScaffold(Islogin: isLogin),
  );
}

class EntryScaffold extends StatefulWidget {
  bool Islogin;
  EntryScaffold({this.Islogin});
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new EntryDescription();
    }
}

class EntryDescription extends State<EntryScaffold> {
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("main entyrpoint"),
        ),
        body: new Container(
          child: Image(
            image: new NetworkImage("http://img.zcool.cn/community/01b2295568a994000001271604da4f.jpg@1280w_1l_2o_100sh.webp"),
          ),
        )
      );
    }
}