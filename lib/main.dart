
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:succulentcactus/screen/splashscreen.dart';


void main() =>  runApp(
  MainApp(),
  );

  class MainApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);

      return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),);
    }
  }