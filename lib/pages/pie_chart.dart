import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final List<PieChartData> datas;
  final double chartWidth;
  final int selectedIndex;

  PieChart(
      {required this.chartWidth, required this.datas, this.selectedIndex = 2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _getPaints(context),
    );
  }

  List<Widget> _getPaints(BuildContext context) {
    List<Widget> customPaints = [];

    late final double selectedStartRadian, selectedSweepRadian;
    late final Color selectedColor1;
    late final Color? selectedColor2;

    double total = 0;
    datas.forEach((data) => total += data.value);
    double startRadian = -pi / 2;

    for (int index = 0; index < datas.length; index++) {
      final PieChartData pieChartData = datas[index];
      final double sweepRadian = pieChartData.value / total * 2 * pi;

      if (selectedIndex == index) {
        selectedStartRadian = startRadian;
        selectedSweepRadian = sweepRadian;
        selectedColor1 = pieChartData.color1;
        selectedColor2 = pieChartData.color2;
      }

      customPaints.add(
        CustomPaint(
          child: Center(),
          painter: _DrawArc(
              chartWidth: chartWidth,
              color1: pieChartData.color1,
              color2: pieChartData.color2,
              startRadian: startRadian,
              sweepRadian: sweepRadian),
        ),
      );

      startRadian += sweepRadian;
    }

    customPaints.add(
      CustomPaint(
        child: Center(),
        painter: _DrawArc(
            chartWidth: chartWidth * 1.3,
            color1: selectedColor1.withOpacity(0.2),
            color2: selectedColor2?.withOpacity(0.2),
            startRadian: selectedStartRadian,
            sweepRadian: selectedSweepRadian),
      ),
    );

    return customPaints;
  }
}

class _DrawArc extends CustomPainter {
  final double chartWidth;
  final Color color1;
  final Color? color2;
  final double startRadian;
  final double sweepRadian;

  _DrawArc(
      {required this.chartWidth,
      required this.color1,
      required this.color2,
      required this.startRadian,
      required this.sweepRadian});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = chartWidth / 2;

    if (color2 != null) {
      paint.shader = LinearGradient(colors: [color1, color2!])
          .createShader(Rect.fromCircle(center: center, radius: radius));
    } else {
      paint.color = color1;
    }

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
  final Color color1;
  final Color? color2;

  PieChartData(
      {required this.name,
      required this.value,
      required this.color1,
      this.color2});
}
