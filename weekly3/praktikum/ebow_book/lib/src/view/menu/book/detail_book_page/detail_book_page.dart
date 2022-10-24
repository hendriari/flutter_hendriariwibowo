import 'package:ebow_book/src/utils/color.dart';
import 'package:flutter/material.dart';

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
              'Segera hadir !',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Sedang dalam pengembangan',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: MyColor.errorColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
