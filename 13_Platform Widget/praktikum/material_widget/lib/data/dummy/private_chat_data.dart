import 'package:flutter/material.dart';
import 'package:platform_widget/data/dummy/chatting_model.dart';

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
          'https://www.pulsk.com/images/2013/02/14/511c6742678cd_511c674269042.jpg',
      jam: '2.15 Am',
      jumlahChat: 1,
      lastChat: 'Hooh tenan.. wedi aku.. hooh..',
      nama: 'Narudin',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      lastOnline: 'terlihat terakhir di tiktod',
      telp: '62 898 89898989'),
  Chatting(
      image:
          'https://cdn-brilio-net.akamaized.net/community/community-news/2019/07/26/49b93d0e9e5a2783b95859ec62acec24/26-image_1564109662_5d3a6b5e391e8.jpg',
      jam: '5.30 Am',
      jumlahChat: 1,
      lastChat: 'Ente kadang - kadang',
      nama: 'Saskeeehhhh',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      lastOnline: 'terlihat belakangan ini',
      telp: '62 897 74273429'),
  Chatting(
      image:
          'https://ae04.alicdn.com/kf/Haf0778c1a213404b9c16883b539a77b71.jpg',
      jam: '7.15 Am',
      jumlahChat: 2,
      lastChat: 'Andaikata.. seandainya benar tuh',
      nama: 'Sakurah',
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      lastOnline: 'terlihat dari tadi',
      telp: '62 895 8932174821'),
  Chatting(
      image:
          'https://cdn-brilio-net.akamaized.net/news/2017/07/06/128327/647221-cosplay-13.jpg',
      jam: '1 Pm',
      jumlahChat: 1,
      lastChat: 'Bro ada komik cinta ga ?',
      nama: 'Kuakuasi',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 891 231231242'),
  Chatting(
      image:
          'https://i.pinimg.com/564x/89/df/3c/89df3c799cfdc40a083db26ec22a728b--cool-cosplay-amazing-cosplay.jpg',
      jam: '3 Pm',
      jumlahChat: 2,
      iconMuted: const Icon(
        Icons.notifications_off,
        color: Colors.grey,
        size: 17,
      ),
      lastChat: 'Mau ikut ga ?',
      nama: 'Jiraya Chan',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 893 4224131344'),
  Chatting(
      image:
          'https://i.kym-cdn.com/photos/images/facebook/001/094/104/614.jpeg',
      jam: '5 Pm',
      jumlahChat: 4,
      lastChat: 'Mau ki slebew kek Obito ?',
      nama: 'Om Guy',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 895 873267613'),
  Chatting(
      image:
          'https://cdn1-production-images-kly.akamaized.net/F-k6JomxclRs8Zx3h999W738qjw=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3527270/original/013003800_1627789363-EL.jpg',
      jam: '5 Pm',
      jumlahChat: 1,
      lastChat: 'Jangan lupa istigfar adik2',
      nama: 'Itaching',
      lastOnline: 'terlihat sedang di proses',
      telp: '62 899 347298347'),
  Chatting(
      image:
          'https://pict.sindonews.net/dyn/480/pena/news/2021/04/30/701/414354/penampakan-ultaraman-joget-koplo-di-pantura-bawa-lobster-bikin-ngakak-wka.jpg',
      jam: '7 Pm',
      jumlahChat: 3,
      lastChat: 'Gass main pes lagi di warung mak asep',
      nama: 'Ultramen ninu ninu',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 327389183'),
  Chatting(
      image:
          'https://media.hitekno.com/thumbs/2021/06/09/30961-windah-basudara-gabung-rrq-youtubeteam-rrq/730x480-img-30961-windah-basudara-gabung-rrq-youtubeteam-rrq.jpg',
      jam: '7 Pm',
      jumlahChat: 1,
      lastChat: 'Jadi buat konten ga nih',
      nama: 'Windah',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3298412183'),
  Chatting(
      image:
          'https://media-assets-ggwp.s3.ap-southeast-1.amazonaws.com/2021/09/ba-evos-esports.jpg',
      jam: '9.30 Pm',
      jumlahChat: 1,
      lastChat: 'Yg kemarin udah kelar yang ?',
      nama: 'Ayang 1',
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
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3849028409'),
  Chatting(
      image:
          'https://img.sportstars.id//2022/07/0LA09L/master_00evSy32k8_2026_wanita_cantik_bernama_vonzy_ditunjuk_menjadi_ba_oleh_tim_esport_onic_sumber_instagram.jpg',
      jam: '2 Pm',
      jumlahChat: 1,
      lastChat: 'Ah ayang bisa aja',
      nama: 'Ayang 6',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 218371901'),
  Chatting(
      image:
          'https://assets.promediateknologi.com/crop/162x1:1114x641/x/photo/2022/06/15/4290956545.png',
      jam: '2.30 Pm',
      jumlahChat: 1,
      lastChat: 'Habis ini yang',
      nama: 'Ayang 7',
      lastOnline: 'terlihat sedang di proses',
      telp: '62 899 344902810'),
  Chatting(
      image:
          'https://media-assets-ggwp.s3.ap-southeast-1.amazonaws.com/2021/10/profil-onic-ladies-5.jpg',
      jam: '5 Pm',
      jumlahChat: 3,
      lastChat: 'Ayang udah makan belum ?',
      nama: 'Ayang 8',
      lastOnline: 'terlihat belakangan ini',
      telp: '62 899 3853904512'),
];
