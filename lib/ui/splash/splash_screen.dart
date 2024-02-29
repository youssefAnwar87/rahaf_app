import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rahaf/ui/auth/login/login_screen.dart';
import 'package:rahaf/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff397FE6),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Column(children: [
              Container(
                width: 360,
                height: 370,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppAssets.splash),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Text(
                    'El-Rahaf Tours',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 32,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = const Color(0xff0F0670),
                    ),
                  ),
                  // Solid text as fill.
                  const Text(
                    'El-Rahaf Tours',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        )
        );
  }
}
