import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double paddingTop = MediaQuery.of(context).padding.top;

    return Stack(
      children: [
        /// header
        Container(
          padding: EdgeInsets.fromLTRB(20, paddingTop, 20, 15),
          height: 120,
          width: sizeWidth,
          decoration: BoxDecoration(
            color: MyColor.primaryColor,
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: MyColor.white),
            ),
          ),
        ),

        /// shape
        Positioned(
          top: 100,
          child: Container(
            height: 50,
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
