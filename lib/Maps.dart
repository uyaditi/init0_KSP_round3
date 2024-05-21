import 'package:flutter/material.dart';
import 'package:kj/services/constants.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapExample extends StatefulWidget {
  @override
  _MapExampleState createState() => _MapExampleState();
}

class _MapExampleState extends State<MapExample> {
  late MapShapeSource _mapSource;
  late List<DistrictData> districtData;

  @override
  void initState() {
    // Define district data with district names and their corresponding values
    districtData = [
      DistrictData('Bengalore', 293958),
      DistrictData('Tumakuru', 66879),
      DistrictData('Hassan', 64399),
      DistrictData('Belagavi', 60516),
      DistrictData('Bengaluru Rural', 60000),
      DistrictData('Shivamogga', 58342),
      DistrictData('Mandya', 54474),
      DistrictData('Chitradurga', 46664),
      DistrictData('Mysuru', 45672),
      DistrictData('Davanagere', 41943),
      DistrictData('Ramanagara', 40902),
      DistrictData('Bidar', 38112),
      DistrictData('Chikkamagaluru', 33338),
      DistrictData('Uttara Kannada', 32536),
      DistrictData('Kalaburagi', 31711),
      DistrictData('Vijayapura', 31330),
      DistrictData('Chickballapura', 30938),
      DistrictData('Mysuru City', 30534),
      DistrictData('Haveri', 29440),
      DistrictData('Bagalkote', 27101),
      DistrictData('Raichur', 27057),
      DistrictData('Mangaluru City', 26712),
      DistrictData('Udupi', 25824),
      DistrictData('Kolar', 24810),
      DistrictData('Vijayanagara', 22018),
      DistrictData('Dakshina Kannada', 21942),
      DistrictData('Ballari', 21055),
      DistrictData('Koppal', 20702),
      DistrictData('Chamarajanagara', 19939),
      DistrictData('Kodagu', 18327),
      DistrictData('Yadgir', 17936),
      DistrictData('Kalaburagi City', 15808),
      DistrictData('Dharwad', 15380),
      DistrictData('Gadag', 14325),
    ];

    // Filter out districts with no data
    List<String> districtsWithData = districtData
        .where((data) => data.value > 0)
        .map((data) => data.district)
        .toList();

    _mapSource = MapShapeSource.asset(
      'assets/KARNATAKA_DISTRICTS.geojson',
      shapeDataField: 'dtname',
      dataCount: districtsWithData.length,
      primaryValueMapper: (int index) => districtsWithData[index],
      shapeColorValueMapper: (int index) {
        // Find the district's value
        final districtName = districtsWithData[index];
        final districtValue = districtData
            .firstWhere((data) => data.district == districtName)
            .value;

        // Define the gradient colors
        final gradientColors = [
          lightest_green,
          lighter_green,
          dark_green // High value color
        ];

        // Define the gradient stops
        final gradientStops = [
          0.0, // Low value stop
          0.5, // Medium value stop
          1.0, // High value stop
        ];

        // Interpolate the color based on the district value
        return Color.lerp(
            gradientColors[0], gradientColors[2], districtValue / 100000)!;
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_light_grey1,
      extendBody: true,
      body: SfMaps(
        layers: <MapShapeLayer>[
          MapShapeLayer(
            source: _mapSource,
            tooltipSettings: MapTooltipSettings(
              color: Colors.grey[700],
              strokeColor: Colors.white,
              strokeWidth: 2,
            ),
            dataLabelSettings: MapDataLabelSettings(
              textStyle: TextStyle(color: Colors.black, fontSize: 10),
              overflowMode: MapLabelOverflow.visible,
            ),
            shapeTooltipBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'District: ${_mapSource.primaryValueMapper!(index)}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Crimes registered: ${districtData.firstWhere((data) => data.district == _mapSource.primaryValueMapper!(index)).value}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DistrictData {
  DistrictData(this.district, this.value);

  final String district;
  final int value;
}
