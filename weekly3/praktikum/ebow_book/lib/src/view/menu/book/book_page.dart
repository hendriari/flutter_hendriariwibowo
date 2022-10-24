import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/widget/book_widget/book_listview.dart';
import 'package:ebow_book/src/widget/widget/header_widget.dart';
import 'package:flutter/material.dart';

class BookStorePage extends StatelessWidget {
  const BookStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// header
            const HeaderWidget(
              title: 'Store',
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Semua Novel',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// book listview
            const BookListView(),
          ],
        ),
      ),
    );
  }
}
