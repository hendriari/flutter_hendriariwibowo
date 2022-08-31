import 'dart:io';

void main() {
  stdout.write('Masukan nilai Anda : ');
  var nilai = num.parse(stdin.readLineSync()!);

  print('Grade nilai Anda : ${hasil(nilai)}');
}

String hasil(num nilai) {
  if (nilai > 70) {
    return 'A';
  } else if (nilai > 40) {
    return 'B';
  } else if (nilai > 0) {
    return 'C';
  } else {
    return 'Teks kosong';
  }
}
