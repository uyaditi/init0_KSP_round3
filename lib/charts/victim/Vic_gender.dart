import 'package:flutter/material.dart';
import 'package:kj/services/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vic_Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Male', 995123, Color.fromRGBO(245, 116, 84, 1)),
      ChartData('Female', 469964, Color.fromRGBO(247, 154, 123, 1)),
    ];
    return Center(
      child: Container(
        child: SfCircularChart(
          series: <CircularSeries>[
            // Render pie chart
            PieSeries<ChartData, String>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelMapper: (ChartData data, _) => data.x,
              radius: '70%',
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.inside,
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: darkest_grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
