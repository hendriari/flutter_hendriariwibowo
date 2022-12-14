/// un usable



// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:praktik/model/data/data_novel/data_novel_terlaris.dart';
// import 'package:praktik/model/model/buku_model.dart';
// import 'package:praktik/util/color.dart';
//
// class TestiCarousel extends StatelessWidget {
//   const TestiCarousel({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//       itemCount: novelBestSeller.length,
//       itemBuilder: (context, index, realIndex) {
//         final BukuModel bestNovel = novelBestSeller[index];
//         return Card(
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: bestNovel.foto,
//                       imageBuilder: (context, imageProvider) => CircleAvatar(
//                         radius: 30,
//                         backgroundImage: imageProvider,
//                       ),
//                       placeholder: (context, url) =>
//                           const CircularProgressIndicator(),
//                       errorWidget: (context, url, error) => const Center(
//                         child: Text('Can\'t load image'),
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: MyColor.dark.withOpacity(.3),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: Row(
//                           children: [
//                             const Icon(
//                               CupertinoIcons.star_fill,
//                               color: Colors.amber,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               '${bestNovel.ranting}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 color: MyColor.white,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   bestNovel.name,
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//                 Text(
//                   'Pengarang : ${bestNovel.penulis}',
//                 ),
//                 Text(
//                   'Rilis : ${bestNovel.rilis}',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   bestNovel.sinopsis,
//                   maxLines: 5,
//                   textAlign: TextAlign.justify,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       options: CarouselOptions(
//         height: 250,
//         viewportFraction: .9,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 4),
//       ),
//     );
//   }
// }
