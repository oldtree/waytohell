import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:ui' show lerpDouble;

void main() {
  runApp(new MaterialApp(
    title: "one two one",
    home: new ChartPage(),
  ));
}

class ChartPage extends StatefulWidget {
  @override
  ChartPageState createState() => new ChartPageState();
}

class ChartPageState extends State<ChartPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("one two one"),
          backgroundColor: Colors.green[100],
        ),
        body: new Center(
          child: new CustomPaint(
            size: new Size(200.0, 100.0),
            painter: new BarChartPainter(tween.animate(animation)),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.refresh),
          onPressed: ChangeData,
        ));
  }

  final random = new Random();
  int dataSet = 50;
  AnimationController animation;
  Tween<double> tween;
  double startHeight;
  double currentHeight;
  double endHeight;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = new Tween<double>(begin: 0.0, end: dataSet.toDouble());
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void ChangeData() {
    setState(() {
      dataSet = random.nextInt(100);
      tween = new Tween<double>(
        begin: tween.evaluate(animation),
        end: dataSet.toDouble(),
      );
      animation.forward(from: 0.0);
    });
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;
  final Animation<double> animation;
  BarChartPainter(Animation<double> animation)
      : animation = animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final barHeight = animation.value;
    final paint = new Paint();
    paint.color = Colors.blue[400];
    paint.style = PaintingStyle.fill;
    canvas.drawRect(
      new Rect.fromLTWH(
        (size.width - barWidth) / 2.0,
        size.height - barHeight,
        barWidth,
        barHeight,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(BarChartPainter old) => false;
}
