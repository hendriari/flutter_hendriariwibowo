import 'package:flutter/material.dart';
import 'package:flutter_layout/presentation/page/list_friend_page.dart';
import 'package:flutter_layout/presentation/page/list_village_kids.dart';

class PageViews extends StatelessWidget {
  const PageViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          Center(child: ListFriend()),
          Center(child: VillageChild()),
        ],
      ),
    );
  }
}
