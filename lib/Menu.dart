import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kj/ChatBot.dart';
import 'package:kj/IPC.dart';
import 'package:kj/PrivacyPolicy.dart';
import 'package:kj/services/constants.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkest_grey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: "btn2",
                onPressed: () {
                  ZoomDrawer.of(context)!.toggle();
                },
                child: const Icon(
                  Icons.close,
                  color: bg_light_grey1,
                ), // Replace with your desired icon
                backgroundColor:
                    darker_grey, // Change the background color as needed
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Welcome User',
                    style: TextStyle(
                        fontFamily: mf,
                        fontSize: 20,
                        color: lightest_green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: lighter_green,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                    color: text_grey,
                    fontFamily: mf,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              onTap: () {
                ZoomDrawer.of(context)!.toggle();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                color: lighter_green,
              ),
              title: Text(
                "IPC Lookup",
                style: TextStyle(
                    color: text_grey,
                    fontFamily: mf,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => IPC()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.chat,
                color: lighter_green,
              ),
              title: Text(
                "Legal-Chat",
                style: TextStyle(
                  color: text_grey,
                  fontFamily: mf,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatBot()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: lighter_green,
              ),
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                    color: text_grey,
                    fontFamily: mf,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Privacypolicy()),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
