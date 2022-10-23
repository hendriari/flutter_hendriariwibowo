import 'package:flutter/material.dart';
import 'package:praktik/screen/menu/book/book_widget/book_list_view.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/widget/header_widget.dart';

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
