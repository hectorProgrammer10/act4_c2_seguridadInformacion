import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const LecturaSeguraApp());
}

class LecturaSeguraApp extends StatelessWidget {
  const LecturaSeguraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lectura Segura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
