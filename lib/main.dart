import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/feature/auth/presentation/views/OTP_Verification_screen.dart';
import 'package:rahaf/feature/auth/presentation/views/forget_password_screen.dart';
import 'package:rahaf/feature/auth/presentation/views/login_screen.dart';
import 'package:rahaf/feature/auth/presentation/views/register_screen.dart';
import 'package:rahaf/core/utils/app_assets.dart';
//
void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            home: AnimatedSplashScreen(
                splashIconSize: 700,
                backgroundColor: const Color(0xff397FE6),
                splashTransition: SplashTransition.fadeTransition,
                splash: Image.asset(AppAssets.splash),
                nextScreen: LoginScreen()),
            routes: {
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  ForgetPasswordScreen(),
              OTPVerificationScreen.routeName: (context) =>
                  OTPVerificationScreen(),
            },
          );
        });
  }
}
