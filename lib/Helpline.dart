import 'package:flutter/material.dart';
import 'package:kj/services/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'SOSProvider.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool sosChecked = false;

  // Method to load sosChecked state from shared preferences
  Future<void> _loadSOSCheckedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sosChecked = prefs.getBool('sosChecked') ?? false;
    });
  }

  // Method to save sosChecked state to shared preferences
  Future<void> _saveSOSCheckedState(bool isChecked) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sosChecked', isChecked);

    // Register or cancel Workmanager task based on sosChecked status
    if (isChecked) {
      Workmanager().registerPeriodicTask(
        'sos_notification_task',
        'sos_notification',
        inputData: {'sosChecked': 'true'},
        initialDelay: Duration(minutes: 2),
      );
    } else {
      Workmanager().cancelByUniqueName('sos_notification_task');
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _loadSOSCheckedState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sosProvider = Provider.of<SOSProvider>(context);

    return Scaffold(
      backgroundColor: sosChecked ? Color(0xffce4036) : bg_light_grey1,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70, bottom: 50),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outermost layer
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1.0 + (_animationController.value * 0.1),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                            center: Alignment.center,
                            radius: 1,
                            colors: sosChecked
                                ? [
                                    Colors.black.withOpacity(0.2),
                                    Colors.transparent,
                                  ]
                                : [
                                    Colors.red.withOpacity(0.2),
                                    Colors.transparent,
                                  ]),
                      ),
                    ),
                  ),
                  // Middle layer
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1.0 + (_animationController.value * 0.1),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 280.0,
                      height: 280.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                            center: Alignment.center,
                            radius: 1,
                            colors: sosChecked
                                ? [
                                    Colors.black.withOpacity(0.3),
                                    Colors.transparent,
                                  ]
                                : [
                                    Colors.red.withOpacity(0.3),
                                    Colors.transparent,
                                  ]),
                      ),
                    ),
                  ),
                  // Innermost layer
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1.0 + (_animationController.value * 0.1),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 260.0,
                      height: 260.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                            center: Alignment.center,
                            radius: 1,
                            colors: sosChecked
                                ? [
                                    Colors.black.withOpacity(0.2),
                                    Colors.transparent,
                                  ]
                                : [
                                    Colors.red.withOpacity(0.2),
                                    Colors.transparent,
                                  ]),
                      ),
                    ),
                  ),
                  // SOS button
                  ElevatedButton(
                    onPressed: !sosChecked
                        ? () {
                            setState(() {
                              sosChecked = true;
                              sosProvider.sosChecked = true;
                              _saveSOSCheckedState(true);
                            });
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          sosChecked ? Colors.white : Color(0xffce4036),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(110.0),
                    ),
                    child: Text(
                      'SOS',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontFamily: mf,
                        color: sosChecked ? Color(0xffce4036) : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: sosChecked
                ? Text(
                    "HOLD ON!",
                    style: TextStyle(
                        fontFamily: mf,
                        fontSize: 16,
                        color: sosChecked ? Colors.white : Color(0xffce4036),
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    "KEEP CALM!",
                    style: TextStyle(
                        fontFamily: mf,
                        fontSize: 16,
                        color: sosChecked ? Colors.white : Color(0xffce4036),
                        fontWeight: FontWeight.bold),
                  ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 50),
            child: Center(
              child: sosChecked
                  ? Text(
                      "Please standby, we are currently requesting for help.",
                      style: TextStyle(
                        color: sosChecked ? Colors.white : Colors.grey,
                        fontFamily: mf,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "After pressing the SOS button, we will contact the nearest hospital, police station to your current location.",
                      style: TextStyle(
                        color: sosChecked ? Colors.white : Colors.grey,
                        fontFamily: mf,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
          Container(
              child: sosChecked
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Text(
                              'Are you out of danger?',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffce4036),
                                fontFamily: mf,
                              ),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffce4036),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                minimumSize: Size(50.0, 50.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  sosChecked = false;
                                  sosProvider.sosChecked = false;
                                  _saveSOSCheckedState(false);
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: darkest_grey,
                                      title: Text(
                                        'Safety Check',
                                        style: TextStyle(
                                            fontFamily: mf, color: white),
                                      ),
                                      content: Text(
                                        'We are still going to connect you to your close contact to ensure your safety.',
                                        style: TextStyle(
                                            fontFamily: mf, color: text_grey),
                                        textAlign: TextAlign.justify,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                                fontFamily: mf,
                                                color: text_grey),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(fontFamily: mf, color: white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 230),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ALERTS',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: sosChecked
                                        ? Colors.white
                                        : Color(0xffce4036),
                                    fontFamily: mf,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.add_alert,
                                color: sosChecked
                                    ? Colors.white
                                    : Color(0xffce4036),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Center(
                            child: Text(
                              "No alerts for now.",
                              style: TextStyle(
                                fontSize: 18,
                                color: sosChecked ? Colors.white : Colors.grey,
                                fontFamily: mf,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
        ],
      ),
    );
  }
}
