import 'package:flutter/material.dart';
import 'package:kj/main.dart';
import 'AlertsCard.dart';
import 'services/constants.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    final List<AlertCard> customCards = [
      AlertCard(
          heading: 'M. G. Road Closed for Public - 14th April',
          subheading:
              'BMC to carry out water pipe reparations. The road will be closed for public use.'),
      AlertCard(
          heading: 'Multiple bulgaries in Banglore',
          subheading:
              'Citizens are requested to inform the authorities about any suspicious activities / people observed.'),
      AlertCard(
          heading: 'City fights with Dengue',
          subheading: 'Citizens are requested to take care of their health.'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg_light_grey1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          'Karnataka State Police',
          style: TextStyle(
              color: darker_grey,
              fontSize: 22,
              fontFamily: mf,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: bg_light_grey1,
        child: ListView.builder(
          itemCount: customCards.length,
          itemBuilder: (context, index) {
            return customCards[index];
          },
        ),
      ),
    );
  }
}
