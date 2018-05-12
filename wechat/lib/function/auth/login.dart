import 'package:flutter/material.dart';
import 'package:wechat/models/auth.dart';


Widget GetLoginScaffold(LoginInfo user){
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("login"),
    ),
    body: new LoginScaffold(loginuser: user),
  );
}

class LoginScaffold extends StatefulWidget {
  LoginInfo loginuser;
  LoginScaffold({this.loginuser});
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new LoginAction();
    }
  
}

class LoginAction extends State<LoginScaffold> {
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>(); 
  TextEditingController nameController;
  TextEditingController passwordController;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      nameController = new TextEditingController();
      passwordController = new TextEditingController();
    }

  void _handInput(){
    if (widget.loginuser.password != widget.loginuser.username){
      setState(() {
      });
    } else {
      setState((){

      });
    }

  }
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Center(
          key: _formkey,
          child: new ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 48.0),
              new TextFormField(
                controller: nameController,
                autofocus: true,
                decoration: new InputDecoration(
                  labelText: "name",
                  icon: const Icon(Icons.person),
                  hintText: "name",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 48.0),
              new TextFormField(
                autofocus: false,
                controller: passwordController,
                decoration: new InputDecoration(
                  labelText: "password",
                  icon: new Icon(Icons.security),
                  hintText: "password",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
                maxLines: 1,
              ),
              SizedBox(height: 48.0),
              new RaisedButton(
                child: new Text("login"),
                onPressed: () {
                  widget.loginuser.username = nameController.text;
                  widget.loginuser.password = passwordController.text;
                  Navigator.pushNamed(context, "/entrypoint");
                },
              ),
              new FlatButton(
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.black54)),
                   onPressed: () {},
              ),
            ],
          ),
      );
    }
}