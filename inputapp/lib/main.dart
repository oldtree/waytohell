import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: 'Flutter Demo', home: new InputApp()));
}

class InputApp extends StatefulWidget {
  @override
  app createState() {
    return new app();
  }
}

class app extends State<InputApp> {
  String inputvalue;
  TextEditingController namecontroller;
  TextEditingController passwordcontoller;
  String passwordValue;

  @override
  void initState() {
    super.initState();
    namecontroller = new TextEditingController();
    passwordcontoller = new TextEditingController();
  }

  void ShowMessage(String msg) {
    showDialog<Null>(
      context: this.context,
      child: new AlertDialog(
        content: new Text(msg),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("loginform"),
      ),
      body: new Column(
        children: <Widget>[
          new TextFormField(
            controller: namecontroller,
            decoration: new InputDecoration(
              icon: new Icon(Icons.account_circle),
              labelText: "username",
              hintText: "username",
            ),
            onSaved: (String value) {
              print(value);
              setState(() {
                inputvalue = value;
              });
            },
          ),
          new TextFormField(
            controller: passwordcontoller,
            decoration: new InputDecoration(
              icon: new Icon(Icons.security),
              labelText: "password",
              hintText: "password",
            ),
            obscureText: true,
            onSaved: (String value) {
              print(value);
              setState(() {
                passwordValue = value;
              });
            },
            onFieldSubmitted: (String value) {
              if (value.length < 8) {
                ShowMessage("密码不少于6位");
              }
            },
          ),
          new RaisedButton(
            child: new Text("提交"),
            onPressed: () {
              print(namecontroller.text);
              print(passwordcontoller.text);
              ShowMessage(inputvalue);
            },
          ),
        ],
      ),
    );
  }
}
