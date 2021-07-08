import 'package:chart/line_chart/line_chart_widget.dart';
import 'package:flutter/material.dart';

class LineChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Line Chart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 140,
                  height: 100,
                  child: LineChartWidget(
                    data: [
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 1),
                          ),
                          value: 0),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 2),
                          ),
                          value: 3),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 3),
                          ),
                          value: 0),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 4),
                          ),
                          value: 3),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 5),
                          ),
                          value: 1),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 6),
                          ),
                          value: 8),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 7),
                          ),
                          value: 2),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 8),
                          ),
                          value: 6),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 9),
                          ),
                          value: 9),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 10),
                          ),
                          value: 6),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 11),
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
