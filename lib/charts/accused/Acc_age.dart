// age_distribution_chart.dart
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Acc_AgeDistributionChart extends StatefulWidget {
  @override
  Acc_AgeDistributionChartState createState() =>
      Acc_AgeDistributionChartState();
}

class Acc_AgeDistributionChartState extends State<Acc_AgeDistributionChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('0-9', 74, Colors.teal),
      _ChartData('10-19', 22495, Color.fromRGBO(106, 192, 245, 1)),
      _ChartData('20-29', 229233, Color.fromRGBO(86, 184, 245, 1)),
      _ChartData('30-39', 198492, Color.fromRGBO(11, 152, 255, 1)),
      _ChartData('40-49', 122949, Color.fromRGBO(7, 105, 175, 1)),
      _ChartData('50-59', 61814, Color.fromRGBO(3, 115, 220, 1)),
      _ChartData('60-69', 27670, Color.fromRGBO(3, 80, 194, 1)),
      _ChartData('70-79', 6348, Color.fromRGBO(1, 34, 108, 1)),
      _ChartData('80-89', 918, Color.fromRGBO(3, 80, 194, 1)),
      _ChartData('90-99', 91, Color.fromRGBO(2, 40, 97, 1)),
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      tooltipBehavior: _tooltip,
      series: <CircularSeries<_ChartData, String>>[
        DoughnutSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelMapper: (_ChartData data, _) => data.x,
          pointColorMapper: (_ChartData data, _) => data.color,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelIntersectAction: LabelIntersectAction.shift,
            labelPosition: ChartDataLabelPosition.inside,
            textStyle: TextStyle(
              fontSize: 10,
              fontWeight:
                  FontWeight.bold, // Adjust font size to fit inside segments
              color: Colors.white, // Set label color to white
            ),
          ),
          name: 'Age-group-wise Accused demographics',
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color = Colors.white;
}
