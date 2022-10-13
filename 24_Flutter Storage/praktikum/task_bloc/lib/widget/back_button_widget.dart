import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_bloc/common/color.dart';

class BackButtonWidget extends StatelessWidget {
  final Function() onTap;

  const BackButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 41,
        width: 41,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: outlineBorder,
          ),
        ),
        child: const Center(
          child: Icon(CupertinoIcons.back),
        ),
      ),
    );
  }
}
