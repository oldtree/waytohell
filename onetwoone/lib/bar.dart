import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'color_palette.dart';

class BarChart {
  BarChart(this.bars);

  factory BarChart.empty(Size size) {
    return new BarChart(<Bar>[]);
  }

  factory BarChart.random(Size size, Random random) {
    const barWidthFraction = 0.75;
    final ranks = selectRanks(random, ColorPalette.primary.length);
    final barCount = ranks.length;
    final barDistance = size.width / (1 + barCount);
    final barWidth = barDistance * barWidthFraction;
    final startX = barDistance - barWidth / 2;
    final bars = new List.generate(
        barCount,
        (i) => new Bar(
              ranks[i],
              startX + i * barDistance,
              barWidth,
              random.nextDouble() * size.height,
              ColorPalette.primary[ranks[i]],
            ));
    return new BarChart(bars);
  }

  static List<int> selectRanks(Random random, int cap) {
    final ranks = <int>[];
    var rank = 0;
    while (true) {
      if (random.nextDouble() < 0.2) rank++;
      if (cap <= rank) break;
      ranks.add(rank);
      rank++;
    }
    return ranks;
  }

  final List<Bar> bars;

  static BarChart lerp(BarChart begin, BarChart end, double t) {
    final bars = <Bar>[];
    final bMax = begin.bars.length;
    final eMax = end.bars.length;
    var b = 0;
    var e = 0;
    while (b + e < bMax + eMax) {
      if (b < bMax && (e == eMax || begin.bars[b] < end.bars[e])) {
        bars.add(Bar.lerp(begin.bars[b], begin.bars[b].collapsed, t));
        b++;
      } else if (e < eMax && (b == bMax || end.bars[e] < begin.bars[b])) {
        bars.add(Bar.lerp(end.bars[e].collapsed, end.bars[e], t));
        e++;
      } else {
        bars.add(Bar.lerp(begin.bars[b], end.bars[e], t));
        b++;
        e++;
      }
    }
    return new BarChart(bars);
  }
}

class BarChartTween extends Tween<BarChart> {
  BarChartTween(BarChart begin, BarChart end) : super(begin: begin, end: end);

  @override
  BarChart lerp(double t) => BarChart.lerp(begin, end, t);
}

class Bar {
  Bar(this.rank, this.x, this.width, this.height, this.color);

  final int rank;
  final double x;
  final double width;
  final double height;
  final Color color;

  Bar get collapsed => new Bar(rank, x, 0.0, 0.0, color);

  bool operator <(Bar other) => rank < other.rank;

  static Bar lerp(Bar begin, Bar end, double t) {
    assert(begin.rank == end.rank);
    return new Bar(
      begin.rank,
      lerpDouble(begin.x, end.x, t),
      lerpDouble(begin.width, end.width, t),
      lerpDouble(begin.height, end.height, t),
      Color.lerp(begin.color, end.color, t),
    );
  }
}

class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin: begin, end: end) {
    assert(begin.rank == end.rank);
  }

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}

class BarChartPainter extends CustomPainter {
  BarChartPainter(Animation<BarChart> animation)
      : animation = animation,
        super(repaint: animation);

  final Animation<BarChart> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()..style = PaintingStyle.fill;
    final chart = animation.value;
    for (final bar in chart.bars) {
      paint.color = bar.color;
      canvas.drawRect(
        new Rect.fromLTWH(
          bar.x,
          size.height - bar.height,
          bar.width,
          bar.height,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(BarChartPainter old) => false;
}
