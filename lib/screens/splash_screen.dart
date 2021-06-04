import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vaccine_finder/main.dart';

class SplashSCreen extends StatefulWidget {
  @override
  _SplashSCreenState createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff676FFE),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/vaccine.png',
              height: 120,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
