import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/ui/auth/OtpVer/otp_ver.dart';
import 'package:rahaf/ui/auth/forgetPassword/forget_password.dart';
import 'package:rahaf/ui/auth/login/login_screen.dart';
import 'package:rahaf/ui/auth/register/register.dart';
import 'package:rahaf/utils/app_assets.dart';
//test1111111
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  const Size(375,812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(splashIconSize: 700,backgroundColor: const Color(0xff397FE6), splashTransition: SplashTransition.fadeTransition,splash: Image.asset(AppAssets.splash), nextScreen: LoginScreen()),
            routes: {
              RegisterScreen.routeName : (context)=> const RegisterScreen(),
              LoginScreen.routeName : (context)=> LoginScreen(),
              ForgetPassword.routeName : (context)=> ForgetPassword(),
              OTPver.routeName : (context)=> OTPver(),

            },
          );
        }
    );

  }
}

