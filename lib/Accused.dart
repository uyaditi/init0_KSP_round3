import 'package:flutter/material.dart';
import 'package:kj/charts/accused/Acc_Profession.dart';
import 'package:kj/charts/accused/Acc_age.dart';
import 'package:kj/charts/accused/Acc_gender.dart';
import 'package:kj/services/constants.dart';

class Accused extends StatelessWidget {
  const Accused({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_light_grey1,
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: darkest_grey),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        darkest_grey,
                        darker_grey,
                      ],
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Acc_AgeDistributionChart(),
                      Text(
                        'Age-group-wise Offender demographics',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontFamily: mf,
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: darkest_grey),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      darkest_grey,
                      darker_grey,
                    ],
                  ),
                ),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Acc_Gender(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gender-wise split of Offenders as of 2024',
                        style: TextStyle(
                          color: white,
                          fontFamily: mf,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: darkest_grey),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        darkest_grey,
                        darker_grey,
                      ],
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      BarChartPage(),
                      Text(
                        'Profession-wise Offender demographics',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontFamily: mf,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
