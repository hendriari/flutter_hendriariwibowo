# Finit State Machines

### Finite State Machines

mesin yang memiliki beberapa jumlah state

    IDDLE = state saat tidak terjadi proses, 
    RUNNING = state prosses berlangsung, 
    ERROR = state prosses gagal / error

### Unit Test

merupakan pengujian fungsi atau metod

2 cara pengujian, yaitu dengan manual atau automatis

    manual dengan melakukan pengecekan manual pada aplikasi 
    automatis menggunakan test runner dengan cara menulis script yang dapat dilakukan berkali kali

### Mocking

melakukan pengetesan dengan menghindari ketergantungan sistem eksternal. dengan menirukan objek yang
memiliki input dan output yang sama dengan aslinya. pengetesan mocking harus menginstal dulu mockito
pada dev_dependencies pubspec.yaml