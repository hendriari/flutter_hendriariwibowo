import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebow_book/src/model/data/data_promo.dart';
import 'package:ebow_book/src/model/model/promo_model.dart';
import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/widget/widget/shimmer_loading.dart';
import 'package:flutter/material.dart';

class PromoListView extends StatelessWidget {
  const PromoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 165,
      width: sizeWidth,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: promotion.length,
          itemBuilder: (context, index) {
            final PromoModel promo = promotion[index];
            return CachedNetworkImage(
              imageUrl: promo.images!,
              imageBuilder: (context, imageProvider) => Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 148,
                    width: 300,
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
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: MyColor.dark.withOpacity(.3),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15.0, 5, 0, 5),
                              child: Text(
                                promo.promoName!,
                                style: TextStyle(
                                    color: MyColor.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
              placeholder: (context, url) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const ShimmersLoading(
                  height: 148,
                  width: 300,
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
          }),
    );
  }
}
