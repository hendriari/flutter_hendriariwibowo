# Flutter State Management

### State

1. Ephemeral State digunakan ketika tidak ada bagian lain pada widget yang mengakses data widgetnya.
   contoh:  PageView , BottomNavigationBar , Switch Button.
2. App State digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget

### Provider

Provider menyediakan sebuah teknik mengolah state yang dapat digunakan untuk memanage data didalam
aplikasi. Manfaat menggunakan provider : Mengalokasikan resource menjadi lebih sederhana. yang harus
diperhatikan dalam menggunakan Provide :

1. dari Packages Provider (ChangeNotifierProvider , MultiProvider , Consumer)
2. ChangeNotifier(built in Class dari Flutter SDK).

### BLoC

Bussiness Logic Component yang digunakan untuk memisahkan antara bussiness logic dengan UI, BloC
menggunakan pola Stream untuk memisahkan UI dengan bussiness logic. 
Cara Kerja BloC :
1. Event sebagai input
2. State sebagai output
3. Bloc sebagai pengelola


