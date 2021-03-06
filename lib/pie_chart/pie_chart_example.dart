import 'package:chart/pie_chart/pie_chart_widget.dart';
import 'package:flutter/material.dart';

class PieChartExample extends StatefulWidget {
  @override
  _PieChartExampleState createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: PieChartWidget(
                    selectedIndex: currentIndex,
                    onSelectedIndexChange: (int newIndex) {
                      setState(() {
                        currentIndex = newIndex;
                      });
                    },
                    chartWidth: 100,
                    datas: [
                      PieChartData(
                        name: "A",
                        value: 30,
                        color: Colors.blue,
                      ),
                      PieChartData(
                        name: "A",
                        value: 40,
                        color: Colors.red,
                        secondaryColor: Colors.yellow,
                      ),
                      PieChartData(
                        name: "A",
                        value: 30,
                        color: Colors.green,
                        secondaryColor: Colors.pink,
                      )
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
