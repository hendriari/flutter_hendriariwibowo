import 'package:flutter/cupertino.dart';
import 'package:praktikum/util/color.dart';

Future showExitDialog(
  BuildContext context,
) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Keluar'),
          content: const Text('Yakin mau keluar ?'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'Batal',
                style: TextStyle(color: MyColor.primaryColor),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'keluar',
                style: TextStyle(color: MyColor.errorColor),
              ),
            ),
          ],
        );
      });
}
