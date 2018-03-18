import 'dart:math';
import 'package:flutter/material.dart';

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

class ChartPageState extends State<ChartPage> {
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
            painter: new BarChartPainter(dataSet.toDouble()),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.refresh),
          onPressed: ChangeData,
        ));
  }

  final random = new Random();
  int dataSet = 50;

  void ChangeData() {
    setState(() {
      dataSet = random.nextInt(100);
    });
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;
  final double barHeight;
  BarChartPainter(this.barHeight);

  @override
  void paint(Canvas canvas, Size size) {
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
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}
