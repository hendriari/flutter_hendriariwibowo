import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/screen/landing/landing_page1.dart';
import 'package:praktik/screen/landing/landing_page2.dart';
import 'package:praktik/screen/landing/landing_page3.dart';
import 'package:praktik/screen/landing/landing_pages.dart';
import 'package:praktik/util/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({Key? key}) : super(key: key);

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  final PageController _pageController = PageController();

  final List<Widget> page = [
    const LandingPageOne(),
    const LandingPageTwo(),
    const LandingPageThree(),
  ];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: page,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 25,
            bottom: MediaQuery.of(context).size.height * .2,
            child: _buildPageIndicator(),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: MyColor.outlineBorder,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const LandingPages(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(color: MyColor.gray),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() => SmoothPageIndicator(
    controller: _pageController,
    count: page.length,
    effect: ExpandingDotsEffect(
      dotWidth: 10,
      dotHeight: 10,
      dotColor: MyColor.outlineBorder,
      activeDotColor: MyColor.gray,
    ),
  );
}
