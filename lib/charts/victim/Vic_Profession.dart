import 'package:flutter/material.dart';
import 'package:kj/services/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vic_Profession extends StatefulWidget {
  @override
  _Vic_ProfessionState createState() => _Vic_ProfessionState();
}

class _Vic_ProfessionState extends State<Vic_Profession> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('Others', 126294),
      _ChartData('Labourer', 131869),
      _ChartData('Farmer', 137931),
      _ChartData('Driver', 28912),
      _ChartData('Businessman', 47692),
      _ChartData('Housewife', 124175),
      _ChartData('Private employee', 31438),
      _ChartData('Self Employed', 10394),
      _ChartData('Student', 84287),
      _ChartData('Police Officer', 38630),
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
            maximum: 140000,
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
