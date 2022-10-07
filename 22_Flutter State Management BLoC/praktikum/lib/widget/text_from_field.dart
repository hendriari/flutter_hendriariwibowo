import 'package:flutter/material.dart';
import 'package:praktikum/common/color.dart';

class TextFormFields extends StatefulWidget {
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final InputBorder? border;
  final Widget? label;
  final TextEditingController? controller;

  const TextFormFields({
    Key? key,
    this.keyboardType,
    this.prefixIcon,
    this.border,
    this.label,
    this.controller,
  }) : super(key: key);

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryColor,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: (value){
        if(value == null || value.isEmpty){
          return 'field tidak boleh kosong';
        }
        return null;
      },
      decoration: InputDecoration(
        label: widget.label,
        labelStyle: TextStyle(color: primaryColor),
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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
