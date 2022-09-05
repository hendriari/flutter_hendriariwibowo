class Hewan {
  int kucing = 5;
  int kambing = 35;
  int serigala = 40;
  int harimau = 120;
  int jerapah = 90;
  int ikan_mas = 1;
  int ikan_duyung = 18;
  int kudanil = 110;
  int? gajah;
}

class Mobil extends Hewan {
  int kapasitasMax = 600;
  List hewan = [
    'kucing',
    'kambing',
    'serigala',
    'harimau',
    'jerapah',
    'ikan cupang',
    'ikan sepat',
    'kudanil'
  ];

  get totalBeratHewan =>
      kucing +
      kambing +
      serigala +
      harimau +
      jerapah +
      ikan_mas +
      ikan_duyung +
      kudanil;

  void totalKeseluruhan() {
    if (totalBeratHewan < kapasitasMax) {
      hewan.add('gajah');
      print('muatan ditambah : $hewan');
    } else {
      print('muatan sudah penuh');
    }
  }
}

void main() {
  var muatanHewan = Mobil();
  print('total berat hewan : ${muatanHewan.totalBeratHewan} kg');
  print('hewan yang di angkut : ${muatanHewan.hewan}');
  print('maximal muatan mobil : ${muatanHewan.kapasitasMax} kg');
  muatanHewan.totalKeseluruhan();
}
