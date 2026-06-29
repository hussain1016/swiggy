import 'package:flutter/material.dart';
import 'package:swiggy/constants.dart';
import 'package:swiggy/home_screen.dart';
import 'package:swiggy/rides_screen.dart';

import 'loginscreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RidesScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
