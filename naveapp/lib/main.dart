import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: '应用程序首页'),
      routes: <String,WidgetBuilder>{
        "/a":(BuildContext context){return new SubPage(title: "A page");},
        "/b":(BuildContext context){return new SubPage(title: "B page");},
        "/c":(BuildContext context){return new SubPage(title: "C page");},
      },
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  DefaultHomePage createState(){
    return  new DefaultHomePage();
  }
}

class DefaultHomePage extends State<HomePage>{
  void OpenNewPage(){
    setState(() {
          Navigator.of(context).push(new  MaterialPageRoute<Null>(
            builder: (BuildContext context){
              return  new Scaffold(
                appBar:  new AppBar(
                  title: new Text("new page"),
                ),
                body: new Center(
                  child: new Text("click to return main page"),
                ),
                floatingActionButton: new FloatingActionButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: new Icon(Icons.replay),
                ),
              );
            }
          ));
    });
  }

  @override
  Widget build(BuildContext context){
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        
      ),
      body: new Center(
        child:new Row(
          children: <Widget>[
            new RaisedButton(
              child: new Text("A page"),
              onPressed: (){
                Navigator.of(context).pushNamed("/a");
              },
            ),
            new RaisedButton(
              child: new Text("B page"),
              onPressed: (){
                Navigator.of(context).pushNamed("/b");
              },
            ),
            new RaisedButton(
              child: new Text("C page"),
              onPressed: (){
                Navigator.of(context).pushNamed("/c");
              },
            )
          ],
        ),
      ),
    );
  }
}

class SubPage extends StatelessWidget{
  SubPage({Key key,this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Text(
          title,
          style: new TextStyle(
            fontSize: 20.0,
            decorationColor: Colors.red[100],
          ),
        ),
      ),
    );
  }
}

