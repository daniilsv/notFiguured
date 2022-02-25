import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartItem {
  final double percent;
  final Color color;

  PieChartItem({
    @required this.percent,
    @required this.color,
  });
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    @required this.pieData,
    Key key,
  }) : super(key: key);

  final List<PieChartItem> pieData;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      margin: EdgeInsets.zero,
      series: List.generate(
        pieData.length,
        (index) => DoughnutSeries<PieChartItem, String>(
          innerRadius: '75%',
          radius: '100%',
          animationDuration: 2000,
          dataSource: pieData,
          pointColorMapper: (PieChartItem data, _) => data.color,
          yValueMapper: (PieChartItem data, _) => data.percent,
          xValueMapper: (PieChartItem data, _) => '',
          startAngle: 0,
          endAngle: 0,
        ),
      ),
    );
  }
}
