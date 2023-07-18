import 'myhomepage.dart';
import 'package:flutter/material.dart';
// import 'myhomepage.dart';
import 'screens/writing_pages/writing_pages1.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
