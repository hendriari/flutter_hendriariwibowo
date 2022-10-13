import 'package:flutter/material.dart';
import 'package:praktik/common/font.dart';
import 'package:praktik/data/user_provider.dart';
import 'package:praktik/presentation/landing_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (context) => UserProvider(),
          child: MaterialApp(
            theme: ThemeData(textTheme: myTextTheme),
            home: const LandingPage(),
            debugShowCheckedModeBanner: false,
          ),
        );
  }
}
