import 'package:flutter/material.dart';
import 'package:task1/data/model/contact_model.dart';

class ContactDetail extends StatelessWidget {
  final Contact kontak;

  const ContactDetail({Key? key, required this.kontak}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(kontak.image == null
                          ? 'https://www.freeiconspng.com/thumbs/account-icon/account-icon-33.png'
                          : kontak.image!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      kontak.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Call',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.message_outlined,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Message',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.videocam,
                                    color: Colors.cyan,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Video',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      child: const Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.call,
                    color: Colors.cyan,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        kontak.telephon,
                      ),
                      const Text(
                        'Mobile | Konoha',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chat_outlined,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.telegram,
                    color: Colors.cyan,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Telegram')
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 10),
              child: Text('Kirim Pesan ke ${kontak.telephon}'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 10),
              child: Text('Kirim Pesan ke ${kontak.telephon}'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 10),
              child: Text('Kirim Pesan ke ${kontak.telephon}'),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.whatsapp,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('WhatsApp'),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 10),
              child: Text('Kirim Pesan ke ${kontak.telephon}'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 10),
              child: Text('Kirim Pesan ke ${kontak.telephon}'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 0, 10),
              child: Text('Kirim Pesan ke ${kontak.telephon}'),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
