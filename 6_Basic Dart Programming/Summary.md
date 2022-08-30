# 6_Basic Dart Programming

## 1. async & sync, Future

### sync / synchronous

adalah kode dijalankan berurutan dari atas ke bawah. artinya jika kita menuliskan dua baris kode maka baris kode kedua
tidak bisa dieksekusi sebelum kode baris pertama selesai dieksekusi. Kita bisa bayangkan ketika sedang berada dalam
antrian kasir. Kita tidak akan dilayani sebelum semua antrian di depan kita selesai dilayani, begitu pula orang di
belakang kita pun harus menunggu gilirannya.

### async / ansynchronous

adalah kode jika kita menuliskan dua baris kode, kita dapat membuat baris kode kedua dieksekusi tanpa harus menunggu
kode pada baris pertama selesai dieksekusi. Dalam dunia nyata bisa kita bayangkan dengan memesan kopi melalui pelayan,
di mana sembari menunggu pesanan kita datang, kita dapat melakukan aktivitas lain seperti membuka laptop atau menulis.
Program asynchronous memungkinkan suatu operasi bisa berjalan sembari menunggu operasi lainnya selesai. Umumnya kita
memanfaatkan asynchronous pada operasi yang besar dan membutuhkan waktu lama, seperti mengambil data dari internet atau
API, menyimpan data ke database, dan membaca data dari sebuah berkas.

### Future

adalah sebuah objek yang mewakili nilai potensial atau kesalahan yang akan tersedia pada suatu waktu di masa mendatang.
dapat dibayangkan future sebagai sebuah kotak paket. Saat menerima paket tersebut, akan ada tiga kondisi yang mungkin
terjadi, antara lain paket masih tertutup (uncompleted), paket dibuka lalu berisi barang sesuai pesanan (completed with
data), dan paket dibuka namun terjadi kesalahan atau tidak sesuai (completed with error). Penerima dari future dapat
menentukan callbacks yang akan menangani nilai atau kesalahan tersebut.

## 2. List, Set, Map

### List
- List digunakan untuk menyimpan banyak data. Data pada List disusun secara berurutan dan diakses menggunakan index. 
  
- List menerapkan zero-based indexing, di mana 0 adalah indeks dari nilai pertama dan list.length - 1 adalah indeks
  dari nilai terakhir.

### Set
- Set digunakan untuk menyimpan banyak data secara unik, tidak ada duplikasi, tidak berurutan, dan tidak diindeks.

- Pada Set memiliki beberapa fungsi yang bisa digunakan, antara lain:
  - add(value), untuk menambahkan nilai value pada Set.
  - remove(value), untuk menghapus nilai value pada Set.
  - union(other), membuat set baru yang berisi gabungan Set ini dan Set other. 
  - intersection(other), membuat set baru yang berisi irisan Set ini dan Set other.

### Map
- Map menyimpan banyak data dengan format pasangan key-value
  
- Terdapat beberapa properti yang tersedia pada Map, antara lain:
  - keys, untuk menampilkan seluruh key yang ada di dalam Map.
  - values, untuk mengetahui seluruh nilai yang ada di dalam Map.
  - clear(), untuk menghapus seluruh key-value yang ada di dalam Map.

## 3. Introduction Dart

### 1. Pengenalan Dart

Dart diciptakan google untuk menggantikan jaavascript yang dinilai banyak memiliki kekurangan,
dart merupakan bahasa yang digunakan framework flutter, dengan ini dart dapat berjalan di multiplatform
seperti web, android dan ios.

### 2. Operator dart dasar

Primitive Tipe data = merupakan inisialisasi tipe data yang akan digunakan
Constan = nilai tidak dapat berubah
assingnment = untuk memberi nilai variabel
comparison = membandingkan kesetaraan nilai
logical = hanya berfungsi pada boolean, untuk menggabungkan beberapa kondisi

### 3. Tipe data

String = untuk teks
int = untuk bilangan bulat
bool = kondisi true / false
double = bilangan pechan