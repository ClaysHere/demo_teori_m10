import 'package:demo_teori_m10/screens/banner_screen.dart';
import 'package:demo_teori_m10/screens/dialog_screen.dart';
import 'package:demo_teori_m10/screens/snackbar_screen.dart';
import 'package:demo_teori_m10/screens/todo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
