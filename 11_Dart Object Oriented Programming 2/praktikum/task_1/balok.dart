import 'dart:io';
import 'bangun_ruang.dart';

class Balok extends BangunRuang {

  @override
  volume() {
    print('volume balok');
    stdout.write('panjang : ');
    panjang = double.parse(stdin.readLineSync()!);
    stdout.write('lebar : ');
    lebar = double.parse(stdin.readLineSync()!);
    stdout.write('tinggi : ');
    tinggi = double.parse(stdin.readLineSync()!);
    var rumusBalok = panjang! * lebar! * tinggi!;
    print('hasil : $rumusBalok');
  }
}
