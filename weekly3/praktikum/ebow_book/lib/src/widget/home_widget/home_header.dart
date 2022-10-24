import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/view/menu/home/notification_page/notification_page.dart';
import 'package:ebow_book/src/widget/widget/icon_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: paddingTop + 8, left: 20),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColor.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButtonWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      );
                    },
                    color: MyColor.white.withOpacity(.3),
                    borderColor: MyColor.transparent,
                    heightContainer: 30,
                    widthContainer: 30,
                    icon: CupertinoIcons.bell_fill,
                    iconColor: Colors.amberAccent,
                  ),
                ),
              ),
              Text(
                'Selamat Datang !',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: MyColor.white,
                    ),
              ),
              Text(
                'Guest',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: MyColor.white),
              ),
            ],
          ),
        ),
        Positioned(
          top: 160,
          child: Container(
            height: 30,
            width: sizeWidth,
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
