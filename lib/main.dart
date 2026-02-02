import 'package:ai/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AiApp());
}

class AiApp extends StatelessWidget {
  const AiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

