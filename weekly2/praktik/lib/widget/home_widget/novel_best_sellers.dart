import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:praktik/model/data/data_novel/data_novel_terlaris.dart';
import 'package:praktik/model/model/buku_model.dart';
import 'package:praktik/screen/menu/home/detail_novel/detail_novel.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/widget/shimmer_laoding.dart';

class NovelBestSeller extends StatelessWidget {
  const NovelBestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: CarouselSlider.builder(
        itemCount: novelBestSeller.length,
        itemBuilder: (context, index, realIndex) {
          final BukuModel bestNovel = novelBestSeller[index];
          return CachedNetworkImage(
            imageUrl: bestNovel.foto,
            imageBuilder: (context, imageProvider) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailHomeNovel(),
                  ),
                );
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 2),
                      blurRadius: 3,
                      color: MyColor.dark.withOpacity(.6),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const ShimmersLoading(
                height: 230,
                width: 150,
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: Text(
                'Can\'t Load Image',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: MyColor.errorColor,
                    ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 230,
          viewportFraction: .41,
          autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 2300),
        ),
      ),
    );
  }
}
