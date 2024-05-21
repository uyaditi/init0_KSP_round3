import 'package:flutter/material.dart';
import 'services/constants.dart';

class AlertCard extends StatelessWidget {
  final String heading;
  final String subheading;

  AlertCard({required this.heading, required this.subheading});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 10, left: 18, right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [darker_grey, darkest_grey],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$heading',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: lightest_green, // Assuming text color should be white
                fontFamily: mf,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '$subheading',
              style: TextStyle(
                fontSize: 14,
                color: text_grey, // Assuming text color should be white
                fontFamily: mf,
              ),
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
