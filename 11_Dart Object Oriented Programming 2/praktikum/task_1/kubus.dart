import 'dart:io';
import 'bangun_ruang.dart';

class Kubus extends BangunRuang{
  @override
  volume(){
   try{
     print('volume kubus');
     stdout.write('sisi : ');
     var nilaiSisi = double.parse(stdin.readLineSync()!);
     double rumusKubus = nilaiSisi * 3;
     print('hasil : $rumusKubus');
   } catch (e){
     print(e);
   }
  }
}