import 'package:flutter/material.dart';
import 'package:praktikum/util/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Segera Hadir Pada'),
            Text(
              'Weekly Task 2',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: MyColor.errorColor),
            ),
          ],
        ),
      ),
    );
  }
}
