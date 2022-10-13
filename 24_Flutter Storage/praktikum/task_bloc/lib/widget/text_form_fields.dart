import 'package:flutter/material.dart';
import 'package:task_bloc/common/color.dart';

class TextFromFields extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String> validator;

  const TextFromFields({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.hintText,
    required this.validator,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: gray,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: border,
        labelStyle: TextStyle(color: primaryColor),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: outlineBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: outlineBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: outlineBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

