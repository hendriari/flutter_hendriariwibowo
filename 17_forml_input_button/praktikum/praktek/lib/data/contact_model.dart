class Contact {
  late String name;
  late String telephon;
  String? image;
  String? home;
  String? birthday;

  Contact({
    required this.name,
    required this.telephon,
    this.image,
    this.home,
    this.birthday,
  });
}
