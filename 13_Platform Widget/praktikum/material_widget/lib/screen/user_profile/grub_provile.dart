import 'package:flutter/material.dart';
import 'package:platform_widget/dummy/chatting_model.dart';

class GrupProfile extends StatefulWidget {
  final Chatting user;

  const GrupProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<GrupProfile> createState() => _GrupProfileState();
}

class _GrupProfileState extends State<GrupProfile>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: double.infinity,
                  color: const Color.fromRGBO(81, 124, 162, 1),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget.user.image),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.user.nama,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.user.lastOnline,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(1, 1),
                                blurRadius: 2)
                          ]),
                      child: Center(
                        child: Icon(
                          Icons.chat_outlined,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Info',
                  style: TextStyle(
                      color: Color.fromRGBO(81, 124, 162, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Prank'),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Notifikasi'),
                const OnChange(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 15,
            width: double.infinity,
            color: Colors.grey.shade200,
          ),
          TabBar(
            labelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.grey,
            controller: tabController,
            tabs: const [
              Tab(text: 'Anggota'),
              Tab(text: 'Media'),
              Tab(text: 'Tautan'),
            ],
          ),
          SizedBox(
            height: 50,
            child: TabBarView(
              controller: tabController,
              children: [
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnChange extends StatefulWidget {
  const OnChange({Key? key}) : super(key: key);

  @override
  State<OnChange> createState() => _OnChangeState();
}

class _OnChangeState extends State<OnChange> {
  bool notif = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          notif == true ? "Hidup" : "Mati",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const Spacer(),
        Switch(
          value: notif,
          onChanged: (value) {
            setState(() {
              notif = !notif;
            });
          },
        )
      ],
    );
  }
}
