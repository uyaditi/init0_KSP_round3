import 'package:flutter/material.dart';

class Educate extends StatelessWidget {
  const Educate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.asset(r'assets/harrasement.png'),
              ],
            )),
      ),
    );
  }
}
