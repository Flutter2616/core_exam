import 'package:core_exam/screen/add_screen.dart';
import 'package:core_exam/screen/home_screen.dart';
import 'package:core_exam/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Splashscreen(),
        'home':(context) => Homescreen(),
        'add':(context) => Addscreen(),
      },
    ),
  );
}
