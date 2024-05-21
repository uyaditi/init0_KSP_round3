import 'package:flutter/material.dart';
import 'package:kj/charts/victim/Vic_Profession.dart';
import 'package:kj/charts/victim/Vic_age.dart';
import 'package:kj/charts/victim/Vic_gender.dart';
import 'package:kj/charts/victim/Vic_injuries.dart';
import 'package:kj/services/constants.dart';

class Victim extends StatelessWidget {
  const Victim({super.key});
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
                      InjuryBubbleChart(),
                      Text(
                        'Victim injuries data',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontFamily: mf,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Gender-wise split (left) and Age-group (right) wise split of victims',
                    style: TextStyle(
                      color: darkest_grey,
                      fontFamily: mf,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Ensure the text is centered
                  ),
                ),
              ),
              Container(
                height: 200,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Vic_Gender(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Vic_AgeDistributionChart(),
                      ),
                    ),
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
                      Vic_Profession(),
                      Text(
                        'Profession details of victims',
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
