import 'package:chart/bar_chart/bar_chart_widget.dart';
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
                child: BarChartWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
