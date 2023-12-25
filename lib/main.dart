import 'package:flutter/material.dart';
import 'package:webtask/core/services/services_locator.dart';
import 'package:webtask/features/home/presentation/pages/home_screen.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
