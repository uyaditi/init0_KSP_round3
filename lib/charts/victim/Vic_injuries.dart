import 'package:flutter/material.dart';
import 'package:kj/services/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InjuryBubbleChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<_ChartData> data = [
      _ChartData('Fatal', 349090, 80),
      _ChartData('Minor', 315373, 75),
      _ChartData('Not Applicable', 221248, 60),
      _ChartData('Grievous', 122253, 50),
      _ChartData('Abused', 1683, 10),
    ];
    final TooltipBehavior _tooltip = TooltipBehavior(enable: true);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(16),
        width: 500, // Adjust width to fit your chart
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(
                color: text_grey, fontWeight: FontWeight.bold, fontFamily: mf),
          ),
          primaryYAxis: NumericAxis(
            labelStyle:
                TextStyle(color: text_grey, fontWeight: FontWeight.bold),
            minimum: 0,
            maximum: 400000,
            interval: 100000,
          ),
          tooltipBehavior: _tooltip,
          series: <CartesianSeries<_ChartData, String>>[
            BubbleSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              sizeValueMapper: (_ChartData data, _) => data.size,
              name: 'Injury Type',
              color: lighter_green.withOpacity(0.6),
              borderColor: lighter_green,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                // labelPosition: ChartDataLabelPosition.middle,
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: lightest_green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.size);

  final String x;
  final double y;
  final double size;
}
