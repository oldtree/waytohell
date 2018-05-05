import 'package:flutter/material.dart';


class LoginInfo {
  LoginInfo({this.username,this.password});
  String username;
  String password; 
  String string(){
    return this.username + this.password;
  }
}

class LoginWidget extends StatefulWidget {
  LoginInfo loginuser;
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new LoginAction();
    }
  
}

class LoginAction extends State<LoginWidget> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build


      return new Container(
        child: Form(
          child: ,
        ),
      );
    }
}