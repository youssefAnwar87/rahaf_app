import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:rahaf/app.dart';
import 'package:rahaf/init_app.dart';

//test
void main() async{

    await InitApp.initialize();

  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}
