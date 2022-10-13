import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function() onPressed;
  final Widget child;
  final double? sizeWidth;
  final Color? onPrimary;
  final BorderSide? borderSide;

  const ButtonWidget({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    this.onPrimary,
    this.sizeWidth,
    this.borderSide,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: child,
      ),
    );
  }
}
