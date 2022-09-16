import 'package:flutter/material.dart';

class Chatting {
  String image;
  int jumlahChat;
  String jam;
  String nama;
  String lastChat;
  Widget? iconMuted;
  String? lastComent;
  Widget? chatnya;
  String? privateChats;
  String lastOnline;
  String? telp;

  Chatting({
    required this.image,
    required this.jam,
    required this.jumlahChat,
    required this.lastChat,
    required this.nama,
    this.iconMuted,
    this.lastComent,
    this.chatnya,
    this.privateChats,
    required this.lastOnline,
    this.telp,
  });
}



