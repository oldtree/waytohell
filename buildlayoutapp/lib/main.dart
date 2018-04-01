import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: "莲花山", home: new MyApp()));
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
          buildButtomColumn(Icons.call, "tele"),
          buildButtomColumn(Icons.near_me, "near by"),
          buildButtomColumn(Icons.call, "share"),
        ],
      ),
    );

    Widget textSection = new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Text(
          '''
          红花山公园地处深圳市光明新区公明街道中心,位居松白公路的北端,红花山公园处处是精雕细刻的绿色，整洁、美丽的红花山公园就像一出浴的少女你无法拒绝她的温柔。登上仅百米的红花山极目远眺，楼群与树木花草相互掩映,经过修剪的树木造型别致分列公路两旁。2007年，光明新区公明街道投资30万元建设的红花山公园电子监控系统已完工，该公园各大出入口、环山路和主要休闲景点已设置25个电子监控探头，已经正式投入使用。辖区居民在此活动又多了道安全“保护网”。
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
