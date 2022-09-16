import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_widget/screen/home_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(81, 124, 162, 1)
        ),
      ),
    );
  }
}
