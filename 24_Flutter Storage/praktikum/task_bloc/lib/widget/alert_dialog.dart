import 'package:flutter/cupertino.dart';
import 'package:task_bloc/common/color.dart';

Future showDialogWidget(BuildContext context, String content, String title) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: TextStyle(color: primaryColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}