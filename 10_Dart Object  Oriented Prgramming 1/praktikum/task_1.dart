import 'data_mobil.dart';

class Muat extends Mobil {
  get totalBeratHewan =>
      kucing +
      kambing +
      serigala +
      harimau +
      jerapah +
      ikan_mas +
      ikan_duyung +
      kudanil;

  void beratAngkut() {
    if (totalBeratHewan < kapasitasMax) {
      hewan.add('gajah');
      print('Muatan ditambah : $hewan');
    } else {
      print('Muatan sudah maximal');
    }
  }
}

void main() {
  var muatanHewan = Muat();
  print('total berat hewan : ${muatanHewan.totalBeratHewan} kg');
  print('hewan yang di angkut : ${muatanHewan.hewan}');
  print('maximal muatan mobil : ${muatanHewan.kapasitasMax} kg');
  muatanHewan.beratAngkut();
}
