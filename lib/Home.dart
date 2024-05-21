import 'package:kj/Charts.dart';
import 'package:kj/Educate.dart';
import 'package:kj/Helpline.dart';
import 'package:kj/SOSProvider.dart';
import 'package:kj/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:kj/Post.dart';
import 'AlertPage.dart';
import 'Maps.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Post(),
    Educate(),
    MapExample(),
    Charts(),
    dashboard()
  ];

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            // heroTag: "btn3",
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: Icon(
              Icons.menu,
              color: darkest_grey,
              size: 30,
            ),
            // backgroundColor: Colors.white,
          ),
        ),
        backgroundColor: bg_light_grey1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          'Karnataka State Police',
          style: TextStyle(
              color: darkest_grey,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: mf),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.circle_notifications_rounded,
              color: darkest_grey,
              size: 35,
            ),
            onPressed: () {
              // Show notification and navigate to notification page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlertPage()),
              );
            },
          ),
        ],
      ),
      // extendBody: true,
      backgroundColor: bg_light_grey1,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: darkest_grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 75,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: GNav(
            gap: 5,
            tabBackgroundGradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                darkest_grey,
                darker_grey,
              ],
            ),
            color: lightest_green,
            activeColor: lighter_green,
            tabBackgroundColor: dark_green.withOpacity(0.3),
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.all(16),
            onTabChange: _onTabChange,
            tabs: [
              GButton(
                icon: CupertinoIcons.rectangle_stack_person_crop,
                text: "Post",
              ),
              GButton(
                icon: CupertinoIcons.book_circle_fill,
                text: "Be Safe",
              ),
              GButton(
                icon: CupertinoIcons.map_pin_ellipse,
                text: "Hotspots",
              ),
              GButton(
                icon: CupertinoIcons.chart_bar_alt_fill,
                text: "Data",
              ),
              GButton(
                icon: CupertinoIcons.exclamationmark_shield_fill,
                text: "SOS",
              ),
            ],
            selectedIndex: _currentIndex,
          ),
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
        ],
      ),
    );
  }
}
