import 'package:ebow_book/src/model/data/data_promo.dart';
import 'package:ebow_book/src/model/model/promo_model.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final List<PromoModel> _promo = promotion;

  List<PromoModel> get promo => _promo;

}
