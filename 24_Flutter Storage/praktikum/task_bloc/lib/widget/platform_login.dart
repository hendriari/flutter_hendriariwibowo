import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_bloc/common/color.dart';

class PlatformLogin extends StatelessWidget {
  final Function() facebookOnTap;
  final Function() googleOnTap;
  final Function() appleOnTap;

  const PlatformLogin({
    Key? key,
    required this.facebookOnTap,
    required this.googleOnTap,
    required this.appleOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: facebookOnTap,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: outlineBorder,
                ),
              ),
              child: const Center(
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 42,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: googleOnTap,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: outlineBorder,
                ),
              ),
              child: Center(
                child: Image.network(
                    'http://pngimg.com/uploads/google/google_PNG19635.png'),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: appleOnTap,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: outlineBorder,
                ),
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.apple,
                  size: 42,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
