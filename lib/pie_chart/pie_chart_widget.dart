import 'dart:math';

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

typedef OnSelectedIndexChange = Function(int newIndex);

class PieChartWidget extends StatelessWidget {
  final List<PieChartData> datas;
  final double chartWidth;
  final int selectedIndex;
  final OnSelectedIndexChange? onSelectedIndexChange;

  const PieChartWidget(
      {required this.chartWidth,
      required this.datas,
      this.selectedIndex = 0,
      this.onSelectedIndexChange});

  @override
  Widget build(BuildContext context) {
    return CanvasTouchDetector(
      builder: (context) => CustomPaint(
        painter: _Draw(
            datas: datas,
            chartWidth: chartWidth,
            selectedIndex: selectedIndex,
            onSelectedIndexChange: onSelectedIndexChange,
            context: context),
        child: const Center(),
      ),
    );
  }
}

class _Draw extends CustomPainter {
  final List<PieChartData> datas;
  final double chartWidth;
  final int selectedIndex;
  final BuildContext context;
  final OnSelectedIndexChange? onSelectedIndexChange;

  _Draw(
      {required this.chartWidth,
      required this.datas,
      required this.selectedIndex,
      required this.context,
      this.onSelectedIndexChange});

  @override
  void paint(Canvas canvas, Size size) {
    final TouchyCanvas myCanvas = TouchyCanvas(context, canvas);

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = chartWidth / 2;

    late final double selectedStartRadian, selectedSweepRadian;
    late final Color selectedColor;
    late final Color? selectedSecondaryColor;

    double total = 0;

    for (final PieChartData data in datas) {
      total += data.value;
    }

    double startRadian = -pi / 2;

    for (int index = 0; index < datas.length; index++) {
      final PieChartData pieChartData = datas[index];
      final double sweepRadian = pieChartData.value / total * 2 * pi;

      if (selectedIndex == index) {
        selectedStartRadian = startRadian;
        selectedSweepRadian = sweepRadian;
        selectedColor = pieChartData.color;
        selectedSecondaryColor = pieChartData.secondaryColor;
      }

      if (pieChartData.secondaryColor != null) {
        paint.shader = LinearGradient(
                colors: [pieChartData.color, pieChartData.secondaryColor!])
            .createShader(Rect.fromCircle(center: center, radius: radius));
      } else {
        paint.shader = null;
        paint.color = pieChartData.color;
      }

      myCanvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint, onTapDown: (_) {
        if (onSelectedIndexChange != null) {
          onSelectedIndexChange!(index);
        }
      });

      startRadian += sweepRadian;
    }

    paint.strokeWidth = (chartWidth / 2) * 1.3;

    if (selectedSecondaryColor != null) {
      paint.shader = LinearGradient(colors: [
        selectedColor.withOpacity(0.2),
        selectedSecondaryColor.withOpacity(0.2)
      ]).createShader(
        Rect.fromCircle(center: center, radius: radius),
      );
    } else {
      paint.shader = null;
      paint.color = selectedColor.withOpacity(0.2);
    }

    myCanvas.drawArc(
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
  final Color color;
  final Color? secondaryColor;

  PieChartData(
      {required this.name,
      required this.value,
      required this.color,
      this.secondaryColor});
}
