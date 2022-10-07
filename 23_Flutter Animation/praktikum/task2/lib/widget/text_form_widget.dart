import 'package:flutter/material.dart';
import 'package:praktik/common/color.dart';

class TextFormFields extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFormFields({
    Key? key,
    this.controller,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: primaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field tidak boleh kosong';
        }
        return null;
      },
      decoration: InputDecoration(
        label: label,
        labelStyle: TextStyle(color: primaryColor),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
