# Flutter Storage

### Storage

digunakan untuk efisiensi penggunaan internet, beberapa contoh local storage yaitu :
shared preferences dan Local database (sqflite)

### Shared Preferances

adalah cara untuk menyimpan data pada local storage, shared preference menyimpan data kedalam
key/value. sharerd preferences hanya dapat menyimpan data sederhana, tipe data shared preferences
dibagi menjadi beberapa tipe data yaitu :

        getBoolean()
        getFloat()
        getInt()
        getLong()
        getString()
        getStringSet()

### SqfLite

Sqflite adalah penyimpanan data lokal yang mana bentuknya itu berupa table. SQLite sendiri merupakan
relational database management system dengan ukuran yang relatif lebih kecil. Karena berukuran lebih
kecil dari MySQL, jadi DB nya sendiri akan tertanam langsung dalam kode program. Tujuan dari
penggunaan SQLite atau pada flutter SQFLite ini bertujuan untuk mengembangkan aplikasi yang bersifat
stand alone atau bisa dibilang kecil – kecilan, atau saat membangun proyek dengan ukuran kecil yang
tidak memerlukan skalabilitas yang besar.
