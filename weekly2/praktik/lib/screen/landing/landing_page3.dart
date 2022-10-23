import 'package:flutter/material.dart';

class LandingPageThree extends StatelessWidget {
  const LandingPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;
    late double sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: sizeHeight * .3,
              width: sizeWidth * .9,
              child:
              Image.asset('assets/images/landing_image/landing_image3.png'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Nikmati Sensasi Membaca Santai Variasimu',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
