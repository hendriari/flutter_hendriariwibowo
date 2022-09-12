import 'dart:io';
import 'matematika.dart';

class Fpb extends Matematika {
  late int x;
  late int y;

  @override
  hasil() {
    int? fpb, kurangDari, lebihDari;

    stdout.write('masukkan angka 1 : ');
    x = int.parse(stdin.readLineSync()!);
    stdout.write('masukkan angka 2 : ');
    y = int.parse(stdin.readLineSync()!);

    if (x <= y) {
      kurangDari = x;
    } else {
      kurangDari = y;
    }

    if (x >= y) {
      lebihDari = x;
    } else {
      lebihDari = y;
    }

    for (int i = 1; i < kurangDari; i++) {
      if (kurangDari % i == 0 && lebihDari % i == 0) {
        fpb = i;
      }
    }
    print('Hasil FPB dari $x dan $y adalah $fpb');
  }
}
