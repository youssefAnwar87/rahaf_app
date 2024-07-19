import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahaf/blocs_observer.dart';
import 'package:rahaf/core/shared/datasources/local/cache_helper.dart';


import '../locator.dart';

class InitApp {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
        await CacheHelper.init();

    HttpOverrides.global = MyHttpOverrides();
    await setupLocator();
    Bloc.observer = BlocsObserver();
  }
}

//best way for ssl certification problem on all http requests
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    try {
      return super.createHttpClient(context)
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
