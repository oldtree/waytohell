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
        child: new Text("click to start"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: OpenNewPage,
        child: new Icon(Icons.open_in_new),
      ),
    );
  }
}

