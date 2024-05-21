// age_distribution_chart.dart
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vic_AgeDistributionChart extends StatefulWidget {
  @override
  Vic_AgeDistributionChartState createState() =>
      Vic_AgeDistributionChartState();
}

class Vic_AgeDistributionChartState extends State<Vic_AgeDistributionChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('0-20', 103114, Color.fromRGBO(224, 96, 170, 1)),
      _ChartData('21-40', 519036, Color.fromRGBO(228, 136, 187, 1)),
      _ChartData('41-60', 287692, Color.fromRGBO(233, 165, 202, 1)),
      _ChartData('61-80', 78673, Color.fromRGBO(239, 195, 220, 1)),
      _ChartData('80+', 4748, Color.fromRGBO(246, 224, 236, 1)),
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
