import 'package:flutter/material.dart';
import 'package:praktik/common/color.dart';

class TextRegisterWidget extends StatelessWidget {
  final Widget child;

  const TextRegisterWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Divider(
            color: outlineBorder,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: child,
        ),
        Flexible(
          child: Divider(
            color: outlineBorder,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
