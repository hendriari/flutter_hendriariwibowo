import 'package:flutter/material.dart';
import 'package:praktik/screen/menu/my_book/my_book_page/my_favorite_book.dart';
import 'package:praktik/screen/menu/my_book/my_book_page/order_book.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/widget/header_widget.dart';

class BookNavigationPage extends StatelessWidget {
  const BookNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          /// header
          const HeaderWidget(title: 'My Book'),

          /// tab bar
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width * .7,
            decoration: BoxDecoration(
              color: MyColor.border,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: MyColor.outlineBorder,
              ),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: MyColor.darkGreen,
              labelColor: MyColor.darkGreen,
              labelStyle: Theme.of(context).textTheme.headline6,
              unselectedLabelColor: MyColor.gray,
              unselectedLabelStyle: Theme.of(context).textTheme.headline6,
              tabs: const [
                Tab(
                  text: 'Favorite',
                ),
                Tab(
                  text: 'My Order',
                ),
              ],
            ),
          ),

          ///tab bar view
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: TabBarView(
                children: [
                  MyFavoriteBook(),
                  OrderBookPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
