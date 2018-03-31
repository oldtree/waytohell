import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "form sample",
    home: new _Form(),
  ));
}

class _Form extends StatefulWidget {
  @override
  FormStateclass createState() {
    return new FormStateclass();
  }
}

class FormStateclass extends State<_Form> {
  String name;
  String password;
  GlobalKey<FormState> forKey = new GlobalKey<FormState>();

  void showMessage(String msg) {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
        content: new Text(msg),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("表单输入"),
      ),
      body: new Center(
        child: new Form(
          key: forKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: "name"),
                onSaved: (String value) {
                  name = value;
                },
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: "password"),
                onSaved: (String value) {
                  password = value;
                },
              ),
              new Row(
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("reset"),
                    onPressed: () {
                      forKey.currentState.reset();
                      showMessage("reseting");
                    },
                  ),
                  new RaisedButton(
                    child: new Text("confirm"),
                    onPressed: () {
                      forKey.currentState.save();
                      showMessage("confirm $name");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
