import 'fpb.dart';
import 'kpk.dart';

void main() {
  print('Menghitung Kelipatan Persekutuan Terkecil');
  var soal1 = Kpk();
  print(soal1.hasil());

  print('');

  print('Menghitung Faktor Persekutuan Terbesar');
  var soal2 = Fpb();
  print(soal2.hasil());
}
