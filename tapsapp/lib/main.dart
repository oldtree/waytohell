import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "tabs sample",
      home: new ScrollableTabsDemo(),
    ));

enum TabsDemoStyle {
  iconsAndText,
  iconsOnly,
  textOnly,
}

class Page {
  final String text;
  final IconData icon;

  Page({
    this.text,
    this.icon,
  });
}

final List<Page> allPage = <Page>[
  new Page(icon: Icons.info, text: "info"),
  new Page(icon: Icons.event, text: "event"),
  new Page(icon: Icons.home, text: "home"),
  new Page(icon: Icons.android, text: "android"),
  new Page(icon: Icons.alarm, text: "alarm"),
  new Page(icon: Icons.face, text: "face"),
  new Page(icon: Icons.language, text: "language"),
];

class ScrollableTabsDemo extends StatefulWidget {
  @override
  _ScrollableTabsDemoState createState() {
    return new _ScrollableTabsDemoState();
  }
}

class _ScrollableTabsDemoState extends State<ScrollableTabsDemo>
    with SingleTickerProviderStateMixin {
  TabController controller;
  TabsDemoStyle style = TabsDemoStyle.iconsAndText;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: allPage.length);
  }

  void changeDemoStyle(TabsDemoStyle newstyke) {
    setState(() {
      style = newstyke;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).accentColor;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("可滚动的标签页"),
        actions: <Widget>[
          new PopupMenuButton<TabsDemoStyle>(
            onSelected: changeDemoStyle,
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<TabsDemoStyle>>[
                  new PopupMenuItem<TabsDemoStyle>(
                      value: TabsDemoStyle.iconsAndText,
                      child: new Text('图标和文本')),
                  new PopupMenuItem<TabsDemoStyle>(
                      value: TabsDemoStyle.iconsOnly, child: new Text('仅图标')),
                  new PopupMenuItem<TabsDemoStyle>(
                      value: TabsDemoStyle.textOnly, child: new Text('仅文本'))
                ],
          ),
        ],
        bottom: new TabBar(
          controller: controller,
          isScrollable: true,
          tabs: allPage.map((Page page) {
            switch (style) {
              case TabsDemoStyle.iconsAndText:
                return new Tab(text: page.text, icon: new Icon(page.icon));
              case TabsDemoStyle.iconsOnly:
                return new Tab(icon: new Icon(page.icon));
              case TabsDemoStyle.textOnly:
                return new Tab(text: page.text);
            }
          }).toList(),
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: allPage.map((Page page) {
          return new Container(
            key: new ObjectKey(page.icon),
            padding: const EdgeInsets.all(12.0),
            child: new Card(
              child: new Center(
                  child: new Icon(
                page.icon,
                color: Colors.green,
                size: 80.0,
              )),
            ),
          );
        }).toList(),
      ),
    );
  }
}
