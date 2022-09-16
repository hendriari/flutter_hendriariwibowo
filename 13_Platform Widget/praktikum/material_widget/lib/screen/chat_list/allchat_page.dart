import 'package:flutter/material.dart';
import 'package:platform_widget/dummy/chatting_model.dart';
import 'package:platform_widget/dummy/grup_chat_data.dart';
import 'package:platform_widget/dummy/private_chat_data.dart';
import 'package:platform_widget/screen/detail_chat/chats_page.dart';
import 'package:platform_widget/screen/detail_chat/grub_chats.dart';

class AllChatsPage extends StatelessWidget {
  const AllChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final Chatting chat = privateChat[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatsPagesss(
                          chats: chat,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black.withOpacity(.1)))),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(81, 124, 162, 1),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(chat.image),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              chat.nama,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Ubuntu',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        SizedBox(
                                          child: chat.iconMuted,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 9.0),
                                      child: SizedBox(child: Text(chat.jam)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      chat.lastChat,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Container(
                                        height: 27,
                                        width: 27,
                                        margin: const EdgeInsets.only(right: 8),
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(
                                              76, 206, 94, 1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${chat.jumlahChat}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: privateChat.length,
            ),

            /// grub
            _grubChat(),
            const SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Text(
                  'Tekan ikon pensil untuk membuat obrolan baru >',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _grubChat() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: grupChat.length,
      itemBuilder: (context, index) {
        final Chatting grup = grupChat[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GrupChatsPage(
                  chats: grup,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(.1),
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(81, 124, 162, 1),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(grup.image),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      grup.nama,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Ubuntu',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SizedBox(
                                  child: grup.iconMuted,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 9.0),
                              child: SizedBox(child: Text(grup.jam)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              grup.lastChat,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(76, 206, 94, 1),
                                  // shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '${grup.jumlahChat}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
