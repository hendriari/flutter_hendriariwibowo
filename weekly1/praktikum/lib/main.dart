import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum/screen/landing/landing_page_view.dart';
import 'package:praktikum/util/font.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LandingPageView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: myTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Colors.amber,
            ),
      ),
    );
  }
}
