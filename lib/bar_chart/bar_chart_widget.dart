import 'package:chart/models/chart_value.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final List<ChartValue> data;
  final Color barColor;
  final double? height;
  final double? barWidth;
  final double? spacing;
  final double? barRadius;

  late final List<double> _data;
  BarChartWidget(
      {required this.data,
      this.barColor = Colors.grey,
      this.height,
      this.barWidth,
      this.spacing,
      this.barRadius}) {
    final List<double> dataArr = [];

    double min = data[0].value;
    double max = data[0].value;

    dataArr.add(data[0].value);

    for (int index = 1; index < data.length; index++) {
      dataArr.add(data[index].value);

      if (min > data[index].value) {
        min = data[index].value;
      }

      if (max < data[index].value) {
        max = data[index].value;
      }
    }

    _data = dataArr.map((e) => _reMap(e, inMin: min, inMax: max)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double _blockSizeVertical = MediaQuery.of(context).size.height / 100;
    double _containerHeight = height ?? 11 * _blockSizeVertical;

    final double _blockSizeHorizontal = MediaQuery.of(context).size.width / 100;

    final double _barWidth = barWidth ?? 0.7 * _blockSizeHorizontal;

    final double _spacing = spacing ?? 1.5 * _blockSizeHorizontal;

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
                height: _data[index] * _containerHeight,
                width: _barWidth,
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(barRadius ?? _barWidth),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  double _reMap(double x, {required double inMin, required double inMax}) {
    double outMin = 0.1;
    double outMax = 1.0;

    return (((outMax - outMin) * (x - inMin)) / (inMax - inMin)) + outMin;
  }
}
