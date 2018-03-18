import 'package:flutter/material.dart';

class Target {
  final String name;
  final String reward;
  Target({
    String name,
    String reward,
  })  : name = name,
        reward = reward;
}

typedef void TargetChangedCallback(
  Target target,
  bool newTarget,
);

class AchievementViewItem extends StatelessWidget {
  AchievementViewItem(
      {Target target, bool newtarget, TargetChangedCallback callback})
      : target = target,
        newTarget = newtarget,
        nTargetChanged = callback,
        super(key: new ObjectKey(target));
  @override
  Widget build(BuildContext context) {
    print("build AchievementViewItem $target");
    return new ListTile(
      onTap: () {
        nTargetChanged(target, !newTarget);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text("囧"),
      ),
      title: new Stack(children: <Widget>[
        new Positioned(
            left: 0.0,
            top: 0.0,
            child: new Text(
              target.name,
              style: _getNameTextStyle(context),
            )),
        new Positioned(
            left: 0.0,
            top: 20.0,
            child: new Text(
              '奖励' + '\n' + target.reward,
              style: _getRewardTextStyle(context),
            )),
      ]),
    );
  }

  final Target target;
  final bool newTarget;
  final TargetChangedCallback nTargetChanged;

  Color _getColor(BuildContext context) {
    return newTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getNameTextStyle(BuildContext context) {
    if (!newTarget) {
      return new TextStyle(
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    }
    return new TextStyle(
      fontSize: 25.0,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle _getRewardTextStyle(BuildContext context) {
    if (!newTarget) {
      return new TextStyle(
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    }
    return new TextStyle(
      fontSize: 25.0,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }
}
