import 'package:ebow_book/src/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showDialogWidget(BuildContext context, Widget content, Widget title) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: MyColor.primaryColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
