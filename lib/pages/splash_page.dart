import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image(
                width: 350,
                height: 350,
                image: AssetImage("assets/images/myNotesLogo.png"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 25, color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
