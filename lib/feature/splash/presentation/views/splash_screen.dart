import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:rahaf/core/routes/routes_names.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/feature/auth/presentation/views/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      screenRouteFunction: () async {
        return RoutesNames.login;
      },
      splashIconSize: 700,
      backgroundColor: const Color(0xff397FE6),
      splashTransition: SplashTransition.fadeTransition,
      splash: Image.asset(AppAssets.splash),
    );
  }
}
