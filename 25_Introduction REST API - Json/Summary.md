# Introduction REST API - JSON

## HTTP

HTTP adalah cara aplikasi untuk berkomunikasi dengan server. alur kernya nya dengan client mengirim
request lalu server mengolah dan memberi response. terdapat 4 method yaitu GET, POST, PUT, dan
DELETE.

## DIO

Pustaka jaringan yang dikembangkan oleh Flutter China. Ini adalah klien Http yang kuat untuk Dart,
yang mendukung Interceptors, konfigurasi Global, FormData, Pembatalan Permintaan, Pengunduhan file,
Timeout, dll. Dio mempermudah kita untuk berkomunikasi dengan server, dengan mengirim data ke server
atau meminta data dari server.

## Json Encode / Serialization

Metode mengubah data list atau map menjadi sebuah data json menggunakan fungsi jsonEncode dari
package dart:convert. Metode ini digunakan ketika ingin mengirimkan request data dalam bentuk json.

## Json Decode / Deserialisasi

Metode mengubah data json menjadi data map menggunakan fungsi jsonEncode dari package dart:convert