import 'dart:io';

import 'matematika.dart';

class Kpk extends Matematika {
  late int x;
  late int y;

  @override
  hasil() {
    int? kpk;

    stdout.write('masukkan angka 1 : ');
    x = int.parse(stdin.readLineSync()!);
    stdout.write('masukkan angka 2 : ');
    y = int.parse(stdin.readLineSync()!);

    for (int i = 1; i < x * y; i++) {
      final X = i % x;
      final Y = i % y;

      if (X == 0 && Y == 0) {
        kpk = i;
        break;
      }
    }
    print('Hasil KPK dari $x dan $y adalah $kpk');
  }
}
