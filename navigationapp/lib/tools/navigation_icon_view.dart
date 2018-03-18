import 'package:flutter/material.dart';

class MyNavigationIconView {
  MyNavigationIconView({
    Widget icon,
    Widget title,
    Color color,
    TickerProvider sync,
  })  : _icon = icon,
        _color = color,
        item = new BottomNavigationBarItem(
          icon: icon,
          title: title,
        ),
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: sync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: new Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final Color _color;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
    BottomNavigationBarType _type,
    BuildContext context,
  ) {
    Color iconColor;
    if (_type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themedata = Theme.of(context);
      iconColor = themedata.brightness == Brightness.light
          ? themedata.primaryColor
          : themedata.accentColor;
    }
    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.02),
          end: const Offset(0.0, 0.00),
        ).animate(_animation),
        child: new IconTheme(
          data: new IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: _icon,
        ),
      ),
    );
  }
}
