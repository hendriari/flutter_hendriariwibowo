import 'package:flutter/material.dart';
import 'package:praktik/data/list/data_promo.dart';
import 'package:praktik/data/model/promo_model.dart';
import 'package:praktik/util/color.dart';

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
            return Row(
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
                      image: AssetImage(promo.images),
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
                            color:
                            MyColor.dark.withOpacity(.3),
                            borderRadius:
                            const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight:
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(
                                15.0, 5, 0, 5),
                            child: Text(
                              promo.promoName,
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
            );
          }),
    );
  }
}
