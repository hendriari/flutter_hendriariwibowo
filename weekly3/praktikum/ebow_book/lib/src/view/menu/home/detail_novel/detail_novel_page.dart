import 'package:ebow_book/src/utils/color.dart';
import 'package:flutter/material.dart';

class DetailHomeNovel extends StatelessWidget {
  const DetailHomeNovel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sedang hadir !',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Sedang dalam pengembangan',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: MyColor.errorColor),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
