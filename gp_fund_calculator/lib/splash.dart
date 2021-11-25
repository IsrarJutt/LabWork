import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gp_fund_calculator/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => calender(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FA18-BCS-057")),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          "GP_Fund Calculator",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
