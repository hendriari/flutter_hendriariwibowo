import 'package:flutter/material.dart';

class LandingPageTwo extends StatelessWidget {
  const LandingPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: sizeHeight * .3,
              child:
              Image.asset('assets/images/landing_images/landing_image2.png'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Dilengkapi Dengan Fitur Baca Dulu Tanpa Harus Membeli Buku Kesukaanmu',
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
