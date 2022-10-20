import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';

class TextHaveAccount extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final String? text;

  const TextHaveAccount({
    Key? key,
    this.text,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text!),
        MaterialButton(
          onPressed: onPressed,
          textColor: MyColor.primaryColor,
          child: child,
        ),
      ],
    );
  }
}