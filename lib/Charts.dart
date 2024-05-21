import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kj/Accused.dart';
import 'package:kj/BarChart.dart';
import 'package:kj/LineChart.dart';
import 'package:kj/Victim.dart';
import 'package:kj/services/constants.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  bool _isAccusedSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_light_grey1,
      body: Column(
        children: [
          ToggleButtons(
            isSelected: [_isAccusedSelected, !_isAccusedSelected],
            // borderColor: dark_green,
            borderRadius: BorderRadius.circular(15),
            onPressed: (index) {
              setState(() {
                _isAccusedSelected = !_isAccusedSelected;
              });
            },
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _isAccusedSelected ? darkest_grey : bg_light_grey1,
                  // borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Offender Demographics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isAccusedSelected ? white : darker_grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: !_isAccusedSelected ? darkest_grey : bg_light_grey1,
                ),
                child: Text(
                  'Victim Demographics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: !_isAccusedSelected ? white : darkest_grey,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: _isAccusedSelected ? Accused() : Victim(),
          ),
        ],
      ),
    );
  }
}
