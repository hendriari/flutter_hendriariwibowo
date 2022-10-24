import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/widget/account_widget/about_us_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }
    return Stack(
      children: [
        Positioned(
          top: posY,
          left: posX,
          child: GestureDetector(
            onTap: () {
              aboutUsDialog(context);
            },
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                double deltaX = details.delta.dx;
                double deltaY = details.delta.dy;
                posX += deltaX;
                posY += deltaY;
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: MyColor.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: MyColor.dark.withOpacity(.4),
                    offset: const Offset(1, 4),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Tooltip(
                message: 'About Us',
                child: Center(
                  child: Icon(
                    CupertinoIcons.info, size: 30,
                    color: MyColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void center(BuildContext context) {
    posX = MediaQuery.of(context).size.width * .93;
    posY = MediaQuery.of(context).size.height * .6;

    setState(() {
      posX = posX;
      posY = posY;
    });
  }
}
