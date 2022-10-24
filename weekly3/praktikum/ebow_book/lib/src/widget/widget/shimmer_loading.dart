import 'package:ebow_book/src/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmersLoading extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmersLoading({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColor.outlineBorder,
      highlightColor: MyColor.white,
      child: Container(
        height: height,
        width: width,
        color: MyColor.white,
      ),
    );
  }
}
