import 'package:cupertino_widget/data/chat_list_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addPaddingTop = MediaQuery.of(context).padding.top;

    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              height: addPaddingTop,
            ),

            /// split Header
            _header(),

            /// split Content
            _content(),
          ],
        ),
      ),
    );
  }

  /// kodingan Header
  Widget _header() {
    return Container(
      height: 119,
      width: double.infinity,
      color: CupertinoColors.systemGrey.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Edit',
                  style: TextStyle(color: CupertinoColors.systemBlue),
                ),
                Text(
                  'Chats',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.launch,
                  color: CupertinoColors.systemBlue,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const CupertinoSearchTextField(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'All Chats',
                          style: TextStyle(
                              fontSize: 14, color: CupertinoColors.systemGrey),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Work',
                          style: TextStyle(
                              fontSize: 14, color: CupertinoColors.systemGrey),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.systemBlue,
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Text(
                              '1',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Unread',
                          style: TextStyle(
                              fontSize: 14, color: CupertinoColors.systemBlue),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.systemBlue,
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Text(
                              '11',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 3,
                      width: 80,
                      decoration: const BoxDecoration(
                          color: CupertinoColors.systemBlue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Personal',
                          style: TextStyle(
                              fontSize: 14, color: CupertinoColors.systemGrey),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.systemBlue,
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Text(
                              '2',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// kodingan Content
  Widget _content() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final ChatList chats = chatList[index];
        return Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(chats.image),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chats.nama,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          chats.lastChat,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: CupertinoColors.systemGrey),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chats.jam,
                        style: const TextStyle(fontSize: 13),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CupertinoColors.systemBlue),
                        child: Center(
                          child: Text(
                            '${chats.jumlahChat}',
                            style: const TextStyle(
                                fontSize: 12, color: CupertinoColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
            ],
          ),
        );
      },
    );
  }
}
