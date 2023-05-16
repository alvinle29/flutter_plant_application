import 'package:flutter/material.dart';
import 'package:flutter_plant_application/pages/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Screen',
      home: OnBoardingScreen()  
    );
  }
}
