import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/view/menu/account/auth_login_page.dart';
import 'package:ebow_book/src/view/menu/book/book_page.dart';
import 'package:ebow_book/src/view/menu/home/home_page.dart';
import 'package:ebow_book/src/widget/menu_widget/show_exit_dialog.dart';
import 'package:ebow_book/src/widget/my_book_widget/book_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const BookStorePage(),
    const BookNavigationPage(),
    const AuthLoginPage(),
  ];

  List<IconData> icons = [
    FontAwesomeIcons.slack,
    FontAwesomeIcons.bookJournalWhills,
    FontAwesomeIcons.bookBookmark,
    FontAwesomeIcons.signature,
  ];

  List<String> mark = [
    'Home',
    'Book',
    'My Book',
    'Account',
  ];

  Future<bool> _onWillPop() async {
    if (_currentPage > 0) {
      setState(() {
        _currentPage = 0;
      });
      return Future(() => false);
    } else {
      bool mehMetu = await showExitDialog(context) ?? false;
      if (mehMetu) {
        setState(() {
          mehMetu = true;
        });
      }
      return Future(() => mehMetu);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: pages[_currentPage],
        bottomNavigationBar: _bottomNavBar(context),
      ),
    );
  }

  Container _bottomNavBar(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: sizeWidth * .05,
        right: sizeWidth * .05,
        bottom: 15,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: MyColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        itemCount: pages.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: sizeWidth * .02),
        itemBuilder: (context, pages) => InkWell(
          onTap: () {
            setState(() {
              _currentPage = pages;
              HapticFeedback.lightImpact();
            });
          },
          splashColor: MyColor.transparent,
          highlightColor: MyColor.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width:
                pages == _currentPage ? sizeWidth * .33 : sizeWidth * .175,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: 45,
                  width: pages == _currentPage ? sizeWidth * .33 : 0,
                  decoration: BoxDecoration(
                    color: pages == _currentPage
                        ? MyColor.white.withOpacity(.2)
                        : MyColor.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: pages == _currentPage ? sizeWidth * .15 : 0,
                        ),
                        AnimatedOpacity(
                          opacity: pages == _currentPage ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            pages == _currentPage ? mark[pages] : '',
                            style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: 20,
                        ),
                        Icon(
                          icons[pages],
                          size: 30,
                          color: pages == _currentPage
                              ? Colors.amberAccent
                              : MyColor.dark.withOpacity(.2),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
