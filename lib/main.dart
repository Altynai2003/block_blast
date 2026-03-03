import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyDayApp());
}

class MyDayApp extends StatelessWidget {
  const MyDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyDay',
      theme: ThemeData(
        primaryColor: const Color(0xFFE88C6B),
        scaffoldBackgroundColor: const Color(0xFFF4EDE4),
        fontFamily: 'Arial',
      ),
      home: const WelcomeScreen(),
    );
  }
}