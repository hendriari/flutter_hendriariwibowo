import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum/util/color.dart';
import 'package:praktikum/widget/widget/icon_button_widget.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  const CommonHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [

        /// header
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          height: 140,
          width: sizeWidth,
          decoration: BoxDecoration(
            color: MyColor.primaryColor,
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  heightContainer: 41,
                  widthContainer: 41,
                  icon: CupertinoIcons.back,
                  borderColor: MyColor.border,
                  iconColor: MyColor.white,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: MyColor.white),
                ),
                const SizedBox(
                  width: 29,
                ),
              ],
            ),
          ),
        ),

        /// shape
        Positioned(
          top: 120,
          child: Container(
            height: 50,
            width: sizeWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
        ),

        /// konten

      ],
    );
  }
}
