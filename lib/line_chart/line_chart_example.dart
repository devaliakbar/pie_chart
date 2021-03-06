import 'package:chart/line_chart/line_chart_widget.dart';
import 'package:chart/models/chart_value.dart';
import 'package:flutter/material.dart';

class LineChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Line Chart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: SizedBox(
                  width: 140,
                  height: 100,
                  child: LineChartWidget(
                    data: [
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 1),
                          ),
                          value: 0),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 2),
                          ),
                          value: 3),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 3),
                          ),
                          value: 0),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 4),
                          ),
                          value: 3),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 5),
                          ),
                          value: 1),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 6),
                          ),
                          value: 8),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 7),
                          ),
                          value: 2),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 8),
                          ),
                          value: 6),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 9),
                          ),
                          value: 9),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 10),
                          ),
                          value: 6),
                      ChartValue(
                          date: DateTime.now().add(
                            const Duration(days: 11),
                          ),
                          value: 9),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
