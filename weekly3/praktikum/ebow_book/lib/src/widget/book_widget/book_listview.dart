import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebow_book/src/model/data/data_novel/data_novel.dart';
import 'package:ebow_book/src/model/model/buku_model.dart';
import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/view/menu/book/detail_book_page/detail_book_page.dart';
import 'package:ebow_book/src/widget/widget/shimmer_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookListView extends StatelessWidget {
  const BookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: semuaNovel.length,
          itemBuilder: (context, index) {
            final BukuModel novels = semuaNovel[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const DetailBookPages(),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                child: Container(
                  /// cover
                  height: 200,
                  width: 150,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// image novel
                      CachedNetworkImage(
                        imageUrl: novels.foto,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: imageProvider)),
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
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: MyColor.errorColor,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// judul novel
                            Text(
                              novels.name,
                              style: Theme.of(context).textTheme.headline6,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 8,
                            ),

                            /// nama penulis
                            Text(
                              novels.penulis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: MyColor.darkGreen),
                            ),

                            const Spacer(),

                            /// tagar 1 , 2 & 3
                            Row(
                              children: [
                                /// tag 1
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: MyColor.ambers.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '${novels.tag1}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 5,
                                ),

                                /// tag 2
                                novels.tag2 != null
                                    ? Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color:
                                      MyColor.ambers.withOpacity(.5),
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '${novels.tag2}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                    : const SizedBox(),

                                const SizedBox(
                                  width: 5,
                                ),

                                /// tag 3
                                novels.tag3 != null
                                    ? Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color:
                                      MyColor.ambers.withOpacity(.5),
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '${novels.tag3}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                    : const SizedBox(),
                              ],
                            ),

                            const SizedBox(
                              height: 5,
                            ),

                            /// tagar 4 & 5
                            Row(
                              children: [
                                /// tag 4
                                novels.tag4 != null
                                    ? Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: MyColor.ambers.withOpacity(.5),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${novels.tag4}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                                    : const SizedBox(),

                                const SizedBox(
                                  width: 5,
                                ),

                                /// tag 5
                                novels.tag5 != null
                                    ? Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color:
                                      MyColor.ambers.withOpacity(.5),
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      '${novels.tag5}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                    : const SizedBox(),
                              ],
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            /// harga
                            Text(
                              NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                                  .format(novels.harga),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                color: MyColor.errorColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
