import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Widget label;

  const TextFormWidget({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.cyan,
      controller: controller,
      decoration: InputDecoration(
        label: label,
        filled: true,
        fillColor: Colors.grey.withOpacity(.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.2),
          ),
        ),
      ),
    );
  }
}
