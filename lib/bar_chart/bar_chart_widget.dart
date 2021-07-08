import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final Color barColor;
  BarChartWidget({this.barColor = Colors.grey});

  final List<double> data = [
    0.1,
    0.15,
    0.1,
    0.3,
    0.8,
    0.9,
    1,
    0.7,
    0.4,
    0.6,
    0.5,
    0.8,
    0.1,
    0.15,
    0.1,
    0.3,
  ];

  @override
  Widget build(BuildContext context) {
    final double _blockSizeVertical = MediaQuery.of(context).size.height / 100;
    double _containerHeight = 11 * _blockSizeVertical;

    final double _blockSizeHorizontal = MediaQuery.of(context).size.width / 100;

    final double _barWidth = 0.7 * _blockSizeHorizontal;

    final double _spacing = 1.5 * _blockSizeHorizontal;

    return Container(
      height: _containerHeight,
      child: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: _spacing),
                height: data[index] * _containerHeight,
                width: _barWidth,
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(_barWidth),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
