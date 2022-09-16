import 'package:flutter/material.dart';
import 'package:platform_widget/dummy/chatting_model.dart';

class GrupChatData extends Chatting {

  GrupChatData(
      {required super.image,
      required super.jam,
      required super.jumlahChat,
      required super.lastChat,
      required super.nama,
      required super.lastOnline});
}

var grupChat = [
  Chatting(
    image:
        'https://images.bisnis-cdn.com/posts/2019/10/30/1164653/para20ketua20arisan20ketika20mengikuti20program-program20mapan205b25d.jpeg',
    jam: '7 Pm',
    jumlahChat: 98,
    lastChat: 'Rohit : Yok gas yok',
    nama: 'Arisan Cucok Meong',
    privateChats: 'anjay mabar',
    lastOnline: '46 anggota',
  ),
  Chatting(
    image:
        'https://cdn-2.tstatic.net/pekanbaru/foto/bank/images/komunitas-mobil-di-pekanbaru-akan-bantu-korban-gempa-di-donggala-dan-palu_20180930_150314.jpg',
    jam: '7.30 Pm',
    jumlahChat: 211,
    lastChat: 'Budi : Anak siapa itu',
    nama: 'Keluarga besar RW 09',
    privateChats: 'anjay mabar',
    lastOnline: '148 anggota',
  ),
  Chatting(
    image:
        'https://asset.kompas.com/crops/9yIbUfCfbZg7zWyBTY7ymcdh1Vo=/0x81:1000x748/750x500/data/photo/2017/08/05/2798888206.jpg',
    jam: '9 Pm',
    jumlahChat: 12,
    lastChat: 'Ranto : Nanti jadi kumpul gak geis ? ',
    nama: 'Jaga parkir komuniti',
    iconMuted: const Icon(
      Icons.notifications_off,
      color: Colors.grey,
      size: 17,
    ),
    privateChats: 'anjay mabar',
    lastOnline: '280 anggota',
  ),
  Chatting(
    image: 'https://cdn-2.tstatic.net/banten/foto/bank/images/cumi-cumi.jpg',
    jam: '12 Am',
    jumlahChat: 123,
    nama: 'Assosiasi Dukun Konoha',
    iconMuted: const Icon(
      Icons.notifications_off,
      color: Colors.grey,
      size: 17,
    ),
    lastChat: 'Nak Jidat : Kabur ah..',
    lastOnline: '30 anggota',
  )
];
