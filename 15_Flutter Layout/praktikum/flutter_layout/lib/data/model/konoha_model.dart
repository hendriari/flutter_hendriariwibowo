class WargaKonohaModel {
  late int id;
  late String name;
  late String image;
  String? slogan;

  WargaKonohaModel({
    required this.id,
    required this.name,
    required this.image,
    this.slogan,
  });
}
