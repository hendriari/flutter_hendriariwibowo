import 'package:cupertino_widget/presentation/pages/navbar_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: NavigationBarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
