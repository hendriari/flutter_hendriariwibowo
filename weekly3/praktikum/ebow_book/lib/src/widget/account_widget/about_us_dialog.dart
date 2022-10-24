import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/widget/account_widget/contact_developer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future aboutUsDialog(BuildContext context) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            children: [
              Text(
                'Tentang Kami',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Ebow Digital adalah Book Store yang menyediakan catalog novel. Ebow Digital menjamin Transaksi aman, Gratis Biaya Pengiriman, Tanpa biaya tambahan, dan Bergaransi sampai Buku di terima dengan keadaan baik',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.start,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ContactDeveloperPage(),
                    ),
                  );
                },
                child: Text(
                  'Contact Developer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: MyColor.primaryColor),
                ),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Kembali',
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: MyColor.primaryColor,
                    ),
              ),
            ),
          ],
        );
      });
}
