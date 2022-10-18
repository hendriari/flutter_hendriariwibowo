import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('My Course Segera Hadir'),
            Text(
              'Pada Weekly Task 2',
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
