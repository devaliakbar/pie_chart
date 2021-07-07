import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final List<PieChartData> datas;
  final double chartWidth;

  PieChart({required this.chartWidth, required this.datas});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _getPaints(context),
    );
  }

  List<Widget> _getPaints(BuildContext context) {
    List<Widget> customPaints = [];

    double total = 0;
    datas.forEach((data) => total += data.value);

    double startRadian = -pi / 2;

    for (int index = 0; index < datas.length; index++) {
      final PieChartData pieChartData = datas[index];
      final double sweepRadian = pieChartData.value / total * 2 * pi;

      customPaints.add(
        CustomPaint(
          child: Center(),
          foregroundPainter: _DrawArc(
              chartWidth: chartWidth,
              color: pieChartData.color,
              startRadian: startRadian,
              sweepRadian: sweepRadian),
        ),
      );

      startRadian += sweepRadian;
    }

    final PieChartData pieChartData = datas[0];
    final double sweepRadian = (pieChartData.value / total * 2 * pi) * 1.08;

    customPaints.add(
      CustomPaint(
        child: Center(),
        foregroundPainter: _DrawArc(
            chartWidth: chartWidth * 1.3,
            color: pieChartData.color.withOpacity(0.2),
            startRadian: (pi / 2) * -1.045,
            sweepRadian: sweepRadian),
      ),
    );

    return customPaints;
  }
}

class _DrawArc extends CustomPainter {
  final double chartWidth;
  final Color color;
  final double startRadian;
  final double sweepRadian;

  _DrawArc(
      {required this.chartWidth,
      required this.color,
      required this.startRadian,
      required this.sweepRadian});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = chartWidth / 2;

    paint.color = color;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startRadian,
      sweepRadian,
      false,
      paint,
    );
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
