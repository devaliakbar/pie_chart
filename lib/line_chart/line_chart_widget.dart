import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<LineChartValue> data;
  final Color barColor;
  final double barWidth;

  LineChartWidget(
      {required this.data, this.barColor = Colors.grey, this.barWidth = 2})
      : assert(data.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: _getFlSpot(),
            isCurved: true,
            barWidth: barWidth,
            colors: [
              barColor,
            ],
            dotData: FlDotData(
              show: false,
            ),
          ),
        ],
        minY: 0,
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: false,
          ),
          leftTitles: SideTitles(
            showTitles: false,
          ),
        ),
        gridData: FlGridData(
          show: false,
        ),
      ),
    );
  }

  List<FlSpot> _getFlSpot() {
    List<FlSpot> returnSpot = [];
    double indexForFlSpot = 0;
    for (int index = 0; index < data.length; index++) {
      if (index == 0) {
        returnSpot.add(
          FlSpot(indexForFlSpot, data[index].value),
        );

        continue;
      }

      final int differnceInDays =
          data[index].date.difference(data[index - 1].date).inDays;

      indexForFlSpot += differnceInDays;

      returnSpot.add(
        FlSpot(indexForFlSpot, data[index].value),
      );
    }

    return returnSpot;
  }
}

class LineChartValue {
  final DateTime date;
  final double value;

  LineChartValue({required this.date, required this.value});
}
