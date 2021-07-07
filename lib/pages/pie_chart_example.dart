import 'package:chart/pages/pie_chart.dart';
import 'package:flutter/material.dart';

class PieChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: PieChart(
                    chartWidth: 100,
                    datas: [
                      PieChartData(
                        name: "A",
                        value: 30,
                        color1: Colors.blue,
                      ),
                      PieChartData(
                          name: "A",
                          value: 40,
                          color1: Colors.red,
                          color2: Colors.yellow),
                      PieChartData(
                          name: "A",
                          value: 30,
                          color1: Colors.green,
                          color2: Colors.pink)
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
