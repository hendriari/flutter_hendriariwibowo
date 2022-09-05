# 8_Collection

## 1. Function

Anonymous Function = fungsi yang digunakan sebagai data
Arrow Function = penulisan ( => ) berisi 1 data statis atau proses

## 2. Dart Futures

### future
future adalah suatu objek yang mewakili nilai potensial atau kesalahan yang akan tersedia pada suatu
waktu di masa mendatang.

pada future bisa menambahkan method delayed untuk menunda eksekusi kode dalam future.
Di mana parameter pertama berisi durasi penundaan dan parameter kedua adalah blok kode atau fungsi yang akan dijalankan.
Pada kasus ini kita menggunakan delayed untuk menunda waktu eksekusi seolah kita sedang mengambil data dari internet maupun menunda jalannya fungsi widget

### synchronous
sync adalah kode program yang dijalankan secara berurutan dari atas ke bawah,
jika di bayangkan, baris kode kedua tidak bisa dijalankan ketika baris pertama selesai di eksekusi

### asyncronous
dalam asynchronous kode kedua dapat dieksekusi tanpa tanpa menunggu kode pertama selesai di eksekusi
Program asynchronous memungkinkan suatu operasi bisa berjalan sembari menunggu operasi lainnya selesai. Umumnya kita memanfaatkan asynchronous pada operasi yang besar dan membutuhkan waktu lama,
seperti mengambil data dari internet atau API, menyimpan data ke database, dan membaca data dari sebuah berkas.

## 3. Collection

Collection merupakan sebuah objek yang bisa menyampaikan kumpulan objek lain.
contoh List, Set, Map

### List
list dapat menampung banyak objek seperti string, number, boolean
list menyimpan data secara berbaris, dan tiap data memiliki index

### Set
set merupakan sebuah collection yang hanya dapat menyimpan nilai unik,
unutuk menambah data dalam set dapat memanfaatkan fungsi add() atau addAll()
fungsi Add berguna untuk menambah satu item ke dalam Set,
sementara fungsi addAll digunakan untuk menambahkan beberapa item sekaligus
ada juga fungsi remove(), yang dapat menghapus objek dalam set yang di inginkan

### Map
Map adalah collection yang dapat menyimpan data dengan format key-value
format map biasanya digunakan pada .json

