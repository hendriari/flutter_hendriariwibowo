import 'package:flutter/material.dart';
import 'package:platform_widget/presentation/pages/chat_list/allchat_page.dart';
import 'package:platform_widget/presentation/pages/chat_list/private_chat_page.dart';
import 'package:platform_widget/presentation/pages/chat_list/unread_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double sizeHeight = MediaQuery.of(context).size.height;
  late double sizeWidth = MediaQuery.of(context).size.width;

  final List<Tab> _tabPage = [
    const Tab(
      text: 'Semua Obrolan',
    ),
    const Tab(
      text: 'Pribadi',
    ),
    const Tab(
      text: 'Tak terbaca',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          title: const Text(
            'Telergan',
            style: TextStyle(fontFamily: 'Ubuntu'),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _tabPage,
          ),
        ),
        drawer: Drawer(
          /// split widget drawer
          child: _drawer(),
        ),
        body: const TabBarView(
          children: [
            AllChatsPage(),
            PrivateChat(),
            UnreadChat(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(81, 124, 162, 1),
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
    //);
  }

  //}

  /// drawer appbar
  Widget _drawer() {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// split header drawer
          _headerDrawer(),
          const SizedBox(
            height: 10,
          ),

          /// split menu drawer
          _menuDrawer(),
        ],
      ),
    );
  }

  /// header drawer
  Widget _headerDrawer() {
    return Container(
      height: sizeHeight * 0.25,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(81, 124, 162, 1),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black54.withOpacity(0.35), BlendMode.colorBurn),
          image: const NetworkImage(
            'https://asset.kompas.com/crops/EGyrhYPJi_psXlT29Sq3KyHMR0E=/40x0:904x576/750x500/data/photo/2021/09/29/6153c38932e38.jpeg',
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 10,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://i.pinimg.com/736x/6a/1b/8d/6a1b8db762ddf4f3f7c6c7c27b2338da.jpg',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Hendri Ari',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '+6289 8989 89',
                    style: TextStyle(color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// menu drawer
  Widget _menuDrawer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.group,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Group Baru',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Kontak',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.call,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Panggilan',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.location_pin,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Pengguna Sekitar',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.label,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Pesan Tersimpan',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Pengaturan',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.person_add,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Undang Teman',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.article_sharp,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Fitur Telergan',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
