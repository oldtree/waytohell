import 'package:flutter/material.dart';
import 'achievement_view_list_item.dart';

class AchievementViewList extends StatefulWidget {
  final List<Target> targets;
  AchievementViewList({
    List<Target> targets,
    Key key,
  })  : targets = targets,
        super(
          key: key,
        );

  @override
  _AchievementViewState createState() => new _AchievementViewState();
}

class _AchievementViewState extends State<AchievementViewList> {
  Set<Target> _achievements = new Set<Target>();
  void _achievementsChanged(Target target, bool newtarget) {
    setState() {
      () {
        print(target);
        if (!newtarget) {
          _achievements.add(target);
        } else {
          _achievements.remove(target);
        }
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('hell hell'),
      ),
      body: new ListView(
          children: widget.targets.map((Target target) {
        return new AchievementViewItem(
          target: target,
          newtarget: _achievements.contains(target),
          callback: _achievementsChanged,
        );
      }).toList()),
    );
  }
}
