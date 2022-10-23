import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';

class HeaderLoginWidget extends StatelessWidget {
  const HeaderLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, paddingTop, 20, 20),
          height: 160,
          width: sizeWidth,
          decoration: BoxDecoration(
            color: MyColor.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ebow Digital',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: MyColor.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 160,
                alignment: Alignment.centerRight,
                child: Text(
                  'v BETA',
                  style: TextStyle(color: MyColor.white),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 140,
          child: Container(
            height: 30,
            width: sizeWidth,
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
