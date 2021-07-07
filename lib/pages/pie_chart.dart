import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final List<PieChartData> datas;
  final double chartWidth;

  PieChart({required this.chartWidth, required this.datas});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PieChart(chartWidth: chartWidth, datas: datas),
    );
  }
}

class _PieChart extends CustomPainter {
  final List<PieChartData> datas;
  final double chartWidth;

  _PieChart({required this.chartWidth, required this.datas});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = chartWidth / 2;

    double total = 0;
    datas.forEach((data) => total += data.value);

    double startRadian = -pi / 2;

    for (int index = 0; index < datas.length; index++) {
      final PieChartData pieChartData = datas[index];
      final sweepRadian = pieChartData.value / total * 2 * pi;
      paint.color = pieChartData.color;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );

      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PieChartData {
  final String name;
  final double value;
  final Color color;

  PieChartData({required this.name, required this.value, required this.color});
}
