import 'dart:async';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
static const String routeName='/';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
       Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}


