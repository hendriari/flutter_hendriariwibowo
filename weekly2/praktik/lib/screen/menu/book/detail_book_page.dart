import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';

class DetailBookPages extends StatelessWidget {
  const DetailBookPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fitur tersedia pada',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Weekly Task 3',
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
