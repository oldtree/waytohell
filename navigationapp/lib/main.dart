import 'package:flutter/material.dart';
import 'tools/navigation_icon_view.dart';

void main() {
  runApp(new MaterialApp(
    title: "just shut up",
    home: new Menus(),
  ));
}

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return new Container(
        margin: const EdgeInsets.all(4.0),
        width: iconTheme.size - 8.0,
        height: iconTheme.size - 8.0,
        decoration: new BoxDecoration(
          color: iconTheme.color,
        ));
  }
}

class Menus extends StatefulWidget {
  @override
  MenusState createState() => new MenusState();
}

class MenusState extends State<Menus> with TickerProviderStateMixin {
  int _currentIndex = 2;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<MyNavigationIconView> _navigationViews;
  @override
  void initState() {
    super.initState();
    _navigationViews = <MyNavigationIconView>[
      new MyNavigationIconView(
        icon: new Icon(Icons.access_alarm),
        title: new Text("成就"),
        color: Colors.deepPurple[500],
        sync: this,
      ),
      new MyNavigationIconView(
        icon: new CustomIcon(),
        title: new Text('行动'),
        color: Colors.deepOrange[500],
        sync: this,
      ),
      new MyNavigationIconView(
        icon: new Icon(Icons.cloud),
        title: new Text('人物'),
        color: Colors.teal[500],
        sync: this,
      ),
      new MyNavigationIconView(
        icon: new Icon(Icons.favorite),
        title: new Text('财产'),
        color: Colors.indigo[500],
        sync: this,
      ),
      new MyNavigationIconView(
        icon: new Icon(Icons.event_available),
        title: new Text('设置'),
        color: Colors.pink[500],
        sync: this,
      ),
    ];
    for (MyNavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }
    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    for (MyNavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];
    for (MyNavigationIconView view in _navigationViews) {
      transitions.add(view.transition(_type, context));
    }
    transitions.sort((FadeTransition a, FadeTransition b) {
      double aValue = a.opacity.value;
      double bValue = b.opacity.value;
      return aValue.compareTo(bValue);
    });
    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
        items: _navigationViews
            .map((MyNavigationIconView navigationView) => navigationView.item)
            .toList(),
        currentIndex: _currentIndex,
        type: _type,
        onTap: (int index) {
          setState(() {
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
          });
        });
    return new Scaffold(
      appBar: new AppBar(title: new Text('底部导航演示'), actions: <Widget>[
        new PopupMenuButton<BottomNavigationBarType>(
            onSelected: (BottomNavigationBarType value) {
              setState(() {
                _type = value;
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<BottomNavigationBarType>>[
                  new PopupMenuItem<BottomNavigationBarType>(
                      value: BottomNavigationBarType.fixed,
                      child: new Text('Fixed')),
                  new PopupMenuItem<BottomNavigationBarType>(
                      value: BottomNavigationBarType.shifting,
                      child: new Text('Shifting'))
                ])
      ]),
      body: new Center(child: _buildTransitionsStack()),
      bottomNavigationBar: botNavBar,
    );
  }
}
