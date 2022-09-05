void main() {
  List<dynamic> pertama = [
    [1, 2, 3, 4],
    ['halo', 'nama', 'saya', 'hendri']
  ];
  List<dynamic> kedua = [
    [5, 6, 7, 8],
    ['tidur', 'makan', 'minum', 'jajan']
  ];
  var gabung = pertama + kedua;
  Map<int, dynamic> map = gabung.asMap();
  print(map);
}
