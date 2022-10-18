import 'package:flutter/material.dart';
import 'package:praktikum/screen/menu/bottom_navigation_page.dart';
import 'package:praktikum/util/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:praktikum/widget/button_widget.dart';

class LandingPages extends StatelessWidget {
  const LandingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: MyColor.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                ///header image
                Container(
                  height: sizeHeight * 0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[MyColor.primaryColor, MyColor.white],
                    ),
                  ),
                ),

                /// images
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: paddingTop,
                    ),
                    child: Image.asset(
                        'assets/images/landing_image/landing_images.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sizeWidth * .15,
            ),

            /// icon
            FaIcon(
              FontAwesomeIcons.bookOpenReader,
              color: MyColor.primaryColor,
            ),
            const SizedBox(
              height: 10,
            ),

            Text(
              'Ebow Academy',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: MyColor.primaryColor),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: 195,
              child: Column(
                children: [
                  Text(
                    'v 1.0.1',
                    style: TextStyle(color: MyColor.gray),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: sizeHeight * .1,
            ),

            /// Start button
            ButtonWidget(
              sizeWidth: sizeWidth * .9,
              backgroundColor: MyColor.dark,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondAnimation) =>
                          const BottomNavigationPage(),
                      transitionDuration: const Duration(milliseconds: 1200),
                      transitionsBuilder:
                          (context, animation, secondAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.linearToEaseOut;

                        var tween = Tween(begin: begin, end: end).chain(
                          CurveTween(curve: curve),
                        );

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                    (route) => false);
              },
              child: const Text('Belajar Sekarang'),
            ),

            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
