class BukuModel {
  final String foto;
  final String name;
  final String penulis;
  final String rilis;
  final String sinopsis;
  final String pengulas;
  final String ulasan;
  final int harga;
  final double ranting;
  late String? tag1;
  late String? tag2;
  late String? tag3;
  late String? tag4;
  late String? tag5;

  BukuModel({
    required this.foto,
    required this.name,
    required this.pengulas,
    required this.penulis,
    required this.rilis,
    required this.sinopsis,
    required this.ulasan,
    required this.harga,
    required this.ranting,
    this.tag1,
    this.tag2,
    this.tag3,
    this.tag4,
    this.tag5,
  });
}
