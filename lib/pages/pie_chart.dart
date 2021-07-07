import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final List<PieChartData> datas;
  final double chartWidth;
  final int selectedIndex;

  PieChart(
      {required this.chartWidth, required this.datas, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Center(),
      painter: _Draw(
          datas: datas, chartWidth: chartWidth, selectedIndex: selectedIndex),
    );
  }
}

class _Draw extends CustomPainter {
  final List<PieChartData> datas;
  final double chartWidth;
  final int selectedIndex;

  _Draw(
      {required this.chartWidth,
      required this.datas,
      required this.selectedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = chartWidth / 2;

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

      if (pieChartData.color2 != null) {
        paint.shader =
            LinearGradient(colors: [pieChartData.color1, pieChartData.color2!])
                .createShader(Rect.fromCircle(center: center, radius: radius));
      } else {
        paint.shader = null;
        paint.color = pieChartData.color1;
      }

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );

      startRadian += sweepRadian;
    }

    paint.strokeWidth = (chartWidth / 2) * 1.3;

    if (selectedColor2 != null) {
      paint.shader = LinearGradient(colors: [
        selectedColor1.withOpacity(0.2),
        selectedColor2.withOpacity(0.2)
      ]).createShader(Rect.fromCircle(center: center, radius: radius));
    } else {
      paint.shader = null;
      paint.color = selectedColor1.withOpacity(0.2);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      selectedStartRadian,
      selectedSweepRadian,
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
