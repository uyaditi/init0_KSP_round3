import 'package:flutter/material.dart';
import 'package:kj/services/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartPage extends StatefulWidget {
  @override
  _BarChartPageState createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('Others', 106774),
      _ChartData('Labourer', 100219),
      _ChartData('Farmer', 91021),
      _ChartData('Driver', 55255),
      _ChartData('Businessman', 38554),
      _ChartData('Housewife', 29868),
      _ChartData('Private firm employee', 17695),
      _ChartData('Self Employed', 13973),
      _ChartData('Student', 9992),
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 400,
        padding: EdgeInsets.all(16),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(color: lightest_green),
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 120000,
            interval: 20000,
            labelStyle: TextStyle(color: lightest_green),
          ),
          tooltipBehavior: _tooltip,
          series: <CartesianSeries<_ChartData, String>>[
            BarSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              color: lighter_green,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelIntersectAction: LabelIntersectAction.shift,
                labelPosition: ChartDataLabelPosition.inside,
                textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight
                      .bold, // Adjust font size to fit inside segments
                  color: text_grey, // Set label color to white
                ),
              ), // Set all bars to blue color
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
