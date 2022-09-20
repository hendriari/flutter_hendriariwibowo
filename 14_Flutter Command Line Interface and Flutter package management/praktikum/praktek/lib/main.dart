import 'package:flutter/material.dart';
import 'package:task_1/bottom_navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavbars(),
      debugShowCheckedModeBanner: false,
    );
  }
}
