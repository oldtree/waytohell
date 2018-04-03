import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "莲花山",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("莲花山"),
      ),
      body: new MyApp(),
    ),
    theme: new ThemeData(
      primaryColor: Colors.red,
      primaryColorBrightness: Brightness.dark,
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _App createState() {
    return new _App();
  }
}

class _App extends State<MyApp> {
  Column buildButtomColumn(IconData icons, String labelinfo) {
    Color color = Theme.of(context).primaryColor;

    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icons, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            labelinfo,
            style: new TextStyle(
              fontSize: 12.0,
              color: color,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buttomSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtomColumn(Icons.call, "phone"),
          buildButtomColumn(Icons.near_me, "near by"),
          buildButtomColumn(Icons.share, "share"),
        ],
      ),
    );

    Widget textSection = new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Text(
          '''
          莲花山公园筹建于1992年10月10日 ，1997年6月23日正式对外局部开放。直属深圳市人民政府城市管理办公室领导。公园现已开发建设并向游人开放的面积为60公顷。
          ''',
          style: new TextStyle(
            fontSize: 10.0,
            color: Colors.green[200],
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          softWrap: true,
        ));

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    "莲花山公园",
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 13.0),
                  ),
                ),
                new Text(
                  "深圳市福田区莲花村",
                  style: new TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13.0,
                  ),
                )
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text(
            "66",
            style: new TextStyle(
              color: Colors.grey[500],
              fontSize: 11.0,
            ),
          )
        ],
      ),
    );
    ListView listview = new ListView(
      children: <Widget>[
        new Image.asset(
          'images/hell.jpg',
          height: 240.0,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttomSection,
        textSection
      ],
    );
    return listview;
  }
}
