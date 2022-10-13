import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/common/font.dart';
import 'package:task_bloc/data/bloc/user_bloc.dart';

import 'presentation/landing_screen/landing_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        theme: ThemeData(textTheme: myTextTheme),
        home: const LandingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
