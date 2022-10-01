import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:praktik/data/model/karakter.dart';
import 'package:praktik/data/string/image_carousel.dart';
import 'package:praktik/data/string/karakter_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// background
class BackgroundHomePage extends StatelessWidget {
  const BackgroundHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;
    late double sizeWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: sizeHeight,
          width: sizeWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              opacity: .1,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background_homepage.png'),
            ),
          ),
        ),
        const HomePage(),
      ],
    );
  }
}

///content
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;
  late double paddingTop = MediaQuery.of(context).padding.top;

  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logos.png',
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 10,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://static.wikia.nocookie.net/howtotrainyourdragon/images/4/40/Phlegma_Transparent.png/revision/latest/top-crop/width/360/height/360?cb=20220424063606',
                      imageBuilder: (context, imageProvider) => Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Center(
                        child: Text('Can\'t load image'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CarouselSlider.builder(
              itemCount: imagesCarousel.length,
              itemBuilder: (context, index, realIndex) {
                final images = imagesCarousel[index];
                return _buildCarouselImage(images, index);
              },
              options: CarouselOptions(
                  height: 170,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      imageIndex = index;
                    });
                  }),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: _buildIndicator(),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'Character',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: karakters.length,
                itemBuilder: (context, index) {
                  final Karakter char = karakters[index];
                  return InkWell(
                    onTap: () {
                      _descriptionBottomSheet(context, index);
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: char.image,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Center(
                            child: Text(
                              'Can\'t load image',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          char.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  ///build image
  Widget _buildCarouselImage(String images, int index) {
    return SizedBox(
      height: 150,
      width: sizeWidth * .95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          images,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// smooth indicator
  Widget _buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: imageIndex,
      count: imagesCarousel.length,
      effect: ExpandingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.grey.shade400,
        activeDotColor: Colors.blueGrey,
      ),
    );
  }

  /// build bottom sheet
  Future _descriptionBottomSheet(context, index) {
    late Karakter char = karakters[index];
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: SizedBox(
                      height: 10,
                      width: 50,
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        _buildAlertDialog(context, index);
                      },
                      child: CachedNetworkImage(
                        imageUrl: char.secondImage,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 180,
                          width: sizeWidth * .95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Center(
                          child: Text(
                            'Can\'t load image',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      char.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    char.description,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          );
        });
  }

  /// show full image dialog
  Future _buildAlertDialog(context, index) {
    late Karakter char = karakters[index];
    return showDialog(
        context: context,
        builder: (context) {
          return CachedNetworkImage(
            imageUrl: char.secondImage,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Text(
              'Can\'t load image',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          );
        });
  }
}
