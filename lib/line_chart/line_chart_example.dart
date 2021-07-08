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
                      LineChartValue(date: DateTime.now(), value: 10000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 1),
                          ),
                          value: 15000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 2),
                          ),
                          value: 13000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 3),
                          ),
                          value: 18000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 4),
                          ),
                          value: 12000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 5),
                          ),
                          value: 20000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 6),
                          ),
                          value: 25000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 7),
                          ),
                          value: 22000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 8),
                          ),
                          value: 30000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 9),
                          ),
                          value: 28000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 10),
                          ),
                          value: 15000),
                      LineChartValue(
                          date: DateTime.now().add(
                            Duration(days: 11),
                          ),
                          value: 10000),
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
