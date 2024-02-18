import 'package:demo2/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Entry point for the application.
void main() => runApp(MyApp());

/// The root widget of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
