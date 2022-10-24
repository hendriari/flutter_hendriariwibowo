import 'package:ebow_book/src/view/landing/landing_page_view.dart';
import 'package:ebow_book/src/view_model/account_view_model/account_view_model.dart';
import 'package:ebow_book/src/view_model/book_view_model/book_view_model.dart';
import 'package:ebow_book/src/view_model/home_view_model/home_view_model.dart';
import 'package:ebow_book/src/view_model/mybook_view_model/mybook_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'src/utils/font.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccountViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => BookViweModel()),
        ChangeNotifierProvider(create: (_) => MyBookViewModel()),
      ],
      child: MaterialApp(
        home: const LandingPageView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: myTextTheme,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: Colors.amber,
              ),
        ),
      ),
    );
  }
}
