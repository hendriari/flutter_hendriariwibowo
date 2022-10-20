import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/widget/icon_button_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double sizeHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: sizeHeight * .1, left: 20),
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
                    onTap: () {},
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
