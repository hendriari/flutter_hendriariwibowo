List data = [1, 2, 3, 4];
int pengali = 9;

Future<void> pengalian(List<dynamic> data, int pengali) async {
  List pengulangan = [];
  for (int i = 0; i < data.length; i++) {
    pengulangan.add(data[i] * pengali);
  }
  print(pengulangan);
}

void main() {
  pengalian(data, pengali);
}
