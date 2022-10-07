import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/contact_bloc.dart';
import 'package:praktikum/bloc/theme_bloc.dart';

import 'presentation/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactBloc()),
        BlocProvider(create: (context) => themeBloc),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        bloc: themeBloc,
        builder: (context, state) {
          return MaterialApp(
            home: const HomePage(),
            theme: state == true ? ThemeData.light() : ThemeData.dark(),
            debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}
