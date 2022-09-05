import 'task_1.dart';

class Muatan extends Muat {
  void totalMuatan() {
    gajah = 160;
    var seluruhBeratHewan = totalBeratHewan + gajah!;
    if (seluruhBeratHewan < kapasitasMax) {
      print('total berat yang dimuat : ${seluruhBeratHewan} kg');
    }
  }
}

void main() {
  var muatanHewan = Muatan();
  print('hewan yang di muat : ${muatanHewan.hewan}');
  print('berat hewan yang dimuat : ${muatanHewan.totalBeratHewan} kg');
  print('maximal muatan mobil : ${muatanHewan.kapasitasMax} kg');
  muatanHewan.beratAngkut();
  muatanHewan.totalMuatan();
}
