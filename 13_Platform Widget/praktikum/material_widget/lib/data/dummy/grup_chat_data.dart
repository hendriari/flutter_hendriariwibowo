import 'package:flutter/material.dart';
import 'package:platform_widget/data/dummy/chatting_model.dart';

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
        'https://dafunda.com/wp-content/uploads/2021/07/Inilah-Bukti-Kalau-Pertahanan-Desa-Konoha-Cukup-Lemah.jpg',
    jam: '7 Pm',
    jumlahChat: 98,
    lastChat: 'Rohit : Yok gas yok',
    nama: 'Arisan Cucok Konoha',
    privateChats: 'anjay mabar',
    lastOnline: '46 anggota',
  ),
  Chatting(
    image:
        'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/10/28/1257832854.jpg',
    jam: '7.30 Pm',
    jumlahChat: 211,
    lastChat: 'Botak : Anak siapa itu',
    nama: 'Keluarga besar Tirigakure',
    privateChats: 'anjay mabar',
    lastOnline: '148 anggota',
  ),
  Chatting(
    image:
        'https://cdn-2.tstatic.net/jateng/foto/bank/images/akatsuki-lumajang_20170617_105833.jpg',
    jam: '9 Pm',
    jumlahChat: 12,
    lastChat: 'Kisame : Nanti jadi kumpul gak geis ? ',
    nama: 'Ronda Akad Suzu ki',
    iconMuted: const Icon(
      Icons.notifications_off,
      color: Colors.grey,
      size: 17,
    ),
    privateChats: 'anjay mabar',
    lastOnline: '280 anggota',
  ),
  Chatting(
    image: 'https://pict.sindonews.net/dyn/620/pena/news/2021/10/31/700/585352/ranking-10-anggota-klan-otsutsuki-terkuat-di-naruto-yqx.jpg',
    jam: '12 Am',
    jumlahChat: 123,
    nama: 'Assosiasi Dukun Konoha',
    iconMuted: const Icon(
      Icons.notifications_off,
      color: Colors.grey,
      size: 17,
    ),
    lastChat: 'Kimin Otsutsuki : Kabur ah..',
    lastOnline: '30 anggota',
  )
];
