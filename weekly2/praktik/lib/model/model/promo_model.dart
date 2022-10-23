class PromoModel {
  final String images;
  final String promoName;
  late String? label;

  PromoModel({
    required this.images,
    required this.promoName,
    this.label,
  });
}