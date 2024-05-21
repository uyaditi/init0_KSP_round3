import 'package:flutter/material.dart';
import 'package:kj/DrawerMain.dart';
import 'package:kj/services/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kj/SOSProvider.dart'; // Adjust the import path as needed

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SOSProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DrawerMain()),
      );
    });

    return Scaffold(
      backgroundColor: bg_light_grey1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ksp_logo-removebg-preview.png',
              width: 300,
              height: 300,
            ),
            Text(
              'Karnataka State Police',
              style: TextStyle(
                  color: lighter_green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Belanosima'),
            ),
          ],
        ),
      ),
    );
  }
}
