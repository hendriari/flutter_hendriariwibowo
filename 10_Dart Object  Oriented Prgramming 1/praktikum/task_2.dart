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
    'ikan mas',
    'ikan duyung',
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
      print('muatan sudah maximal');
    }
  }

  void totalMuatan() {
    gajah = 160;
    var seluruhBeratHewan = totalBeratHewan + gajah!;

    if (seluruhBeratHewan < kapasitasMax) {
      print('total berat yang dimuat : ${seluruhBeratHewan} kg');
    }
  }
}

void main() {
  var muatanHewan = Mobil();
  print('hewan yang di muat : ${muatanHewan.hewan}');
  print('berat hewan yang dimuat : ${muatanHewan.totalBeratHewan} kg');
  print('maximal muatan mobil : ${muatanHewan.kapasitasMax} kg');
  muatanHewan.totalKeseluruhan();
  muatanHewan.totalMuatan();
}
