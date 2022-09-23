import 'package:flutter/material.dart';
import 'package:praktek/presentation/home_page.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}