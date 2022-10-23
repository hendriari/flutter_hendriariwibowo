import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:praktik/widget/home_widget/home_header.dart';
import 'package:praktik/widget/home_widget/novel_best_sellers.dart';
import 'package:praktik/widget/home_widget/novel_terbaru.dart';
import 'package:praktik/widget/home_widget/promo_listview.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/widget/shimmer_laoding.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// header
            const HomeHeader(),



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
                'Novel Terlaris',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// novel best widget
            const NovelBestSeller(),

            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Novel Terbaru',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            /// novel best widget
            const NovelTerbaru(),

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
                  'https://minanews.net/wp-content/uploads/2022/06/IIBF2022-e1654170929637.png',
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
              placeholder: (context, url) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ShimmersLoading(
                  height: 170,
                  width: sizeWidth,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Text('Can\'t load image'),
              ),
            ),

            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
