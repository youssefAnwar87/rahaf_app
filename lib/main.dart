import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:rahaf/app.dart';

//test
void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}
