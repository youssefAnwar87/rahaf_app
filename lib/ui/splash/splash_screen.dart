import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rahaf/ui/auth/login/login_screen.dart';
import 'package:rahaf/utils/app_assets.dart';

class SplashScreen extends StatelessWidget{
  static const String routeName = "splash screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration (seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(AppAssets.splash,
      fit:  BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
