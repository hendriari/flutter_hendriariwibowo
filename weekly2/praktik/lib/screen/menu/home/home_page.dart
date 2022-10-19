import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/screen/menu/home/component/promo_listview.dart';
import 'package:praktik/screen/menu/home/component/testi_carousel.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/icon_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    final double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),

        /// kanvas
        child: SizedBox(
          height: sizeHeight * 1.3,
          width: sizeWidth,
          child: Stack(
            children: [
              /// header
              Container(
                padding: EdgeInsets.only(top: sizeHeight * .1, left: 20),
                height: sizeHeight * .25,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColor.primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButtonWidget(
                          onTap: () {},
                          color: MyColor.white.withOpacity(.3),
                          borderColor: MyColor.transparent,
                          heightContainer: 30,
                          widthContainer: 30,
                          icon: CupertinoIcons.bell_fill,
                          iconColor: Colors.amberAccent,
                        ),
                      ),
                    ),
                    Text(
                      'Selamat Datang !',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: MyColor.white,
                          ),
                    ),
                    Text(
                      'Guest',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: MyColor.white),
                    ),
                  ],
                ),
              ),

              /// konten
              Positioned(
                top: sizeHeight * .23,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: sizeWidth,
                  decoration: BoxDecoration(
                    color: MyColor.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Promo untukmu',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      /// promo
                      const PromoListView(),

                      const SizedBox(
                        height: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Event',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),

                      /// event
                      CachedNetworkImage(
                        imageUrl:
                            'https://bitlabs.id/blog/wp-content/uploads/2020/12/apa-itu-coding-1152x648.png',
                        imageBuilder: (context, imageProvider) => Container(
                          margin: const EdgeInsets.all(10),
                          height: 170,
                          width: sizeWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 4),
                                color: MyColor.dark.withOpacity(.6),
                                blurRadius: 4,
                              ),
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imageProvider,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Center(
                          child: Text('Can\'t load image'),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Testimoni Siswa',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      /// testimoni widget
                      const TestiCarousel(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
