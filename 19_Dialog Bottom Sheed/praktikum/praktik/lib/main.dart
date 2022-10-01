import 'package:flutter/material.dart';
import 'package:praktik/presentation/landing_page.dart';

void main()=>runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu'
      ),
    );
  }
}
