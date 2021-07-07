import 'dart:math';

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class PieChart extends StatelessWidget {
  final List<PieChartData> datas;
  final double chartWidth;
  final int selectedIndex;

  PieChart(
      {required this.chartWidth, required this.datas, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return CanvasTouchDetector(
      builder: (context) => CustomPaint(
        child: Center(),
        painter: _Draw(
            datas: datas,
            chartWidth: chartWidth,
            selectedIndex: selectedIndex,
            context: context),
      ),
    );
  }
}

class _Draw extends CustomPainter {
  final List<PieChartData> datas;
  final double chartWidth;
  final int selectedIndex;
  final BuildContext context;

  _Draw(
      {required this.chartWidth,
      required this.datas,
      required this.selectedIndex,
      required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = chartWidth / 2;

    late final double selectedStartRadian, selectedSweepRadian;
    late final Color? selectedColor;
    late final Gradient? selectedGradient;

    double total = 0;
    datas.forEach((data) => total += data.value);
    double startRadian = -pi / 2;

    for (int index = 0; index < datas.length; index++) {
      final PieChartData pieChartData = datas[index];
      final double sweepRadian = pieChartData.value / total * 2 * pi;

      if (selectedIndex == index) {
        selectedStartRadian = startRadian;
        selectedSweepRadian = sweepRadian;
        selectedColor = pieChartData.color;
        selectedGradient = pieChartData.gradient;
      }

      if (pieChartData.gradient != null) {
        paint.shader = pieChartData.gradient!
            .createShader(Rect.fromCircle(center: center, radius: radius));
      } else {
        paint.shader = null;
        paint.color = pieChartData.color!;
      }

      final TouchyCanvas myCanvas = TouchyCanvas(context, canvas);

      myCanvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint, onTapDown: (_) {
        print("sele $index");
      });

      startRadian += sweepRadian;
    }

    paint.strokeWidth = (chartWidth / 2) * 1.3;

    if (selectedGradient != null) {
      paint.shader = selectedGradient
          .createShader(Rect.fromCircle(center: center, radius: radius));
    } else {
      paint.shader = null;
      paint.color = selectedColor!.withOpacity(0.2);
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
  final Color? color;
  final Gradient? gradient;

  PieChartData(
      {required this.name, required this.value, this.color, this.gradient})
      : assert(color != null || gradient != null);
}
