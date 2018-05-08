import 'package:flutter/material.dart';
import 'package:wechat/models/auth.dart';

class EntryPoint extends StatefulWidget {
  bool Islogin;
  EntryPoint({this.Islogin});
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new EntryDescription();
    }
}

class EntryDescription extends State<EntryPoint> {
  @override
    Widget build(BuildContext context) {
      return new Container(
        child: Image(

        ),
      );
    }
}