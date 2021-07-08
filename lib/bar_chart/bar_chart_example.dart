import 'package:chart/bar_chart/bar_chart_widget.dart';
import 'package:chart/models/chart_value.dart';
import 'package:flutter/material.dart';

class BarChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: BarChartWidget(
                  data: [
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 1),
                        ),
                        value: 0),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 2),
                        ),
                        value: 3),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 3),
                        ),
                        value: 0),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 4),
                        ),
                        value: 3),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 5),
                        ),
                        value: 1),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 6),
                        ),
                        value: 8),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 7),
                        ),
                        value: 2),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 8),
                        ),
                        value: 6),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 9),
                        ),
                        value: 9),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 10),
                        ),
                        value: 6),
                    ChartValue(
                        date: DateTime.now().add(
                          Duration(days: 11),
                        ),
                        value: 9),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
