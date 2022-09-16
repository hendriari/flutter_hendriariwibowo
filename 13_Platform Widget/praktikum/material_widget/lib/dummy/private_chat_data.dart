import 'package:flutter/material.dart';
import 'package:platform_widget/dummy/chatting_model.dart';

class PrivateChatData extends Chatting {

  PrivateChatData(
      {required super.image,
      required super.jam,
      required super.jumlahChat,
      required super.lastChat,
      required super.nama,
      required super.lastOnline});
}

var privateChat = [
  Chatting(
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Gus_Samsudin_Jadab.jpg/800px-Gus_Samsudin_Jadab.jpg',
      jam: '2.15 Am',
      jumlahChat: 11,
      lastChat: 'Hooh tenan.. wedi aku.. hooh..',
      nama: 'Mamang Kudin',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat terakhir di tiktod',
      telp: '62 898 89898989'),
  Chatting(
      image:
          'https://assets.pikiran-rakyat.com/crop/0x0:0x0/220x140/photo/2022/09/01/2759432220.jpg',
      jam: '5.30 Am',
      jumlahChat: 10,
      lastChat: 'Ente kadang - kadang',
      nama: 'Nak Jidat',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 897 74273429'),
  Chatting(
      image:
          'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/08/28/3191924269.jpg',
      jam: '7.15 Am',
      jumlahChat: 12,
      lastChat: 'Andaikata.. seandainya benar tuh',
      nama: 'Om Pirduas',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat agak kaga waras',
      telp: '62 895 8932174821'),
  Chatting(
      image:
          'https://pict.sindonews.net/dyn/850/pena/news/2022/08/07/187/848725/profil-dan-biodata-marcel-radhival-pesulap-merah-yang-getol-bongkar-trik-perdukunan-berkedok-agama-qcb.jpeg',
      jam: '1 Pm',
      jumlahChat: 15,
      lastChat: 'Ya nggaklah wkwk',
      nama: 'Marcelinos Marwadi',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 891 231231242'),
  Chatting(
      image:
          'https://image.jpnn.com/resize/1200x800-80/arsip/normal/2022/03/22/mbak-rara-istiati-wulandari-beraksi-di-motogp-indonesia-foto-gjhi.jpg',
      jam: '3 Pm',
      jumlahChat: 2,
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      lastChat: 'Disana hujan ga ?',
      nama: 'Mbak Riri',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 893 4224131344'),
  Chatting(
      image:
          'https://img.celebrities.id/okz/900/6Dr8C5/master_p5UF117T7o_2006_richard_lee.jpg',
      jam: '5 Pm',
      jumlahChat: 14,
      lastChat: 'Sya juga tidak percaya itu',
      nama: 'Dr. Rocklee',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 895 873267613'),
  Chatting(
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Irjen_Ferdy_Sambo_di_Mapolda_Jawa_Tengah.jpg/220px-Irjen_Ferdy_Sambo_di_Mapolda_Jawa_Tengah.jpg',
      jam: '5 Pm',
      jumlahChat: 17,
      lastChat: 'Jangan lupa istigfar adik2',
      nama: 'Predi Shampoo',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat sedang di proses',
      telp: '62 899 347298347'),
  Chatting(
      image:
          'https://pict.sindonews.net/dyn/620/pena/news/2022/07/27/13/837955/diperiksa-komnas-ham-ini-pengakuan-bharada-e-soal-baku-tembak-yang-menewaskan-brigadir-j-lqy.jpg',
      jam: '7 Pm',
      jumlahChat: 17,
      lastChat: 'Gass main pes lagi di warung mak asep',
      nama: 'Badara Ez',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 327389183'),
  Chatting(
      image:
      'https://media.hitekno.com/thumbs/2021/06/09/30961-windah-basudara-gabung-rrq-youtubeteam-rrq/730x480-img-30961-windah-basudara-gabung-rrq-youtubeteam-rrq.jpg',
      jam: '7 Pm',
      jumlahChat: 1,
      lastChat: 'Jadi buat konten ga nih',
      nama: 'Windah',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3298412183'),
  Chatting(
      image:
      'https://media-assets-ggwp.s3.ap-southeast-1.amazonaws.com/2021/09/ba-evos-esports.jpg',
      jam: '9.30 Pm',
      jumlahChat: 1,
      lastChat: 'Yg kemarin udah kelar yang ?',
      nama: 'Ayang 1',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 9023982904'),
  Chatting(
      image:
      'https://media-assets-ggwp.s3.ap-southeast-1.amazonaws.com/2021/09/ba-onic-esports.jpg',
      jam: '9.45 Am',
      jumlahChat: 1,
      lastChat: 'Nanti sore jadi nonton gak beb ?',
      nama: 'Ayang 2',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3234234989'),
  Chatting(
      image:
      'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/12/1859072765.jpg',
      jam: '11 pm',
      jumlahChat: 2,
      nama: 'Ayang 3',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 3,
      ),
      lastChat: 'Aku punya hadiah buat ayang :D',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 34273492378'),
  Chatting(
      image:
      'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/asep-abdul-ketua-bomber.jpg',
      jam: '1 Pm',
      jumlahChat: 2,
      lastChat: 'Paket ku udah sampe bang ??',
      nama: 'Asep',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3128310294'),
  Chatting(
      image:
      'https://assets.skor.id/crop/0x0:0x0/750x500/photo/2022/01/12/4182297435.jpeg',
      jam: '1.15 Pm',
      jumlahChat: 2,
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      lastChat: 'Masa sih yang ?',
      nama: 'Ayang 4',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3849028409'),
  Chatting(
      image:
      'https://img.sportstars.id//2022/07/0LA09L/master_00evSy32k8_2026_wanita_cantik_bernama_vonzy_ditunjuk_menjadi_ba_oleh_tim_esport_onic_sumber_instagram.jpg',
      jam: '2 Pm',
      jumlahChat: 1,
      lastChat: 'Ah ayang bisa aja',
      nama: 'Ayang 6',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 218371901'),
  Chatting(
      image:
      'https://assets.promediateknologi.com/crop/162x1:1114x641/x/photo/2022/06/15/4290956545.png',
      jam: '2.30 Pm',
      jumlahChat: 1,
      lastChat: 'Habis ini yang',
      nama: 'Ayang 7',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat sedang di proses',
      telp: '62 899 344902810'),
  Chatting(
      image:
      'https://media-assets-ggwp.s3.ap-southeast-1.amazonaws.com/2021/10/profil-onic-ladies-5.jpg',
      jam: '5 Pm',
      jumlahChat: 3,
      lastChat: 'Ayang udah makan belum ?',
      nama: 'Ayang 8',
      privateChats: 'anjay mabar',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3853904512'),
];
