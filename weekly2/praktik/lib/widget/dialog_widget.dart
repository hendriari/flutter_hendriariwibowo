import 'package:flutter/cupertino.dart';
import 'package:praktik/util/color.dart';

Future showDialogWidget(BuildContext context, String content, String title) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title,),
          content: Text(content),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: TextStyle(color: MyColor.primaryColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
