import 'package:flutter/material.dart';
import 'package:praktik/presentation/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;
    late double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: sizeHeight,
            width: sizeWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: sizeWidth / 2 - 100,
            top: sizeHeight / 3,
            child: SizedBox(
              width: sizeWidth * .5,
              child: Image.asset(
                'assets/images/logos.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 100,
            left: 100,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  side: const BorderSide(color: Colors.white)),
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Text(
                'Let\'s see',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _showBottomSheet(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;
    late double sizeWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.6), BlendMode.darken),
                    image: const AssetImage(
                      'assets/images/nightfury.png',
                    ),
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: sizeHeight / 4,
                left: sizeWidth / 2 - 50,
                child: Container(
                  alignment: Alignment.center,
                  width: 110,
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(90),
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.elliptical(120, 120),
                    ),
                  ),
                  child: const Text(
                    'Are you ready my Friend ?',
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: sizeWidth / 2 - 60,
                child: SizedBox(
                  height: sizeHeight * .9,
                  child: Image.asset(
                    'assets/images/hiccup.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BackgroundHomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
