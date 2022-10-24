import 'package:ebow_book/src/utils/color.dart';
import 'package:flutter/material.dart';

class TextFromFields extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String> validator;

  const TextFromFields({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.hintText,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    required this.validator,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.gray,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: MyColor.gray),
        filled: true,
        fillColor: MyColor.border,
        labelStyle: TextStyle(color: MyColor.primaryColor),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.outlineBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.errorColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.outlineBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.outlineBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
