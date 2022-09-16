import 'package:flutter/material.dart';
import 'package:platform_widget/dummy/chatting_model.dart';
import 'package:platform_widget/screen/user_profile/user_profile.dart';

class ChatsPagesss extends StatelessWidget {
  final Chatting chats;

  const ChatsPagesss({Key? key, required this.chats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/light_background.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const SizedBox(
              width: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(
                      user: chats,
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          chats.image,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chats.nama,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        chats.lastOnline,
                        style: const TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sentiment_satisfied_alt,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const Flexible(
                    fit: FlexFit.tight,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Message',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.grey.shade500,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic_none_outlined,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
