import 'package:desi/pages/Onboardingscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desi App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: OnboardingScreen(),
    );
  }
}
