import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/widget/home_widget/notifikasi_saran.dart';
import 'package:ebow_book/src/widget/widget/common_header.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const CommonHeader(title: 'Notification'),

            /// remove padding top
            MediaQuery.removePadding(
              removeTop: true,
              context: context,

              /// notif
              child: const NotifikasiSaran(),
            ),
          ],
        ),
      ),
    );
  }
}
