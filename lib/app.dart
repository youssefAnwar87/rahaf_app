
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rahaf/core/routes/routes_manager.dart';
import 'package:rahaf/core/theme/themes_manager.dart';

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
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            theme: ThemesManager.lightTheme,
            builder: DevicePreview.appBuilder,
            routerConfig: RoutesManager.routes,
            
          );
        });
  }
}
