import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // backgroundColor: CupertinoColors.white,
      // navigationBar: CupertinoNavigationBar(
      //   trailing: Icon(CupertinoIcons.search),
      //   leading: Icon(CupertinoIcons.arrow_left,),
      //   backgroundColor: CupertinoColors.systemGrey.withOpacity(0.1),
      //   middle: Text('Chats', style: TextStyle(color: Colors.black),),
      // ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(color: CupertinoColors.systemBlue),
                          ),
                          Text(
                            'Chats',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Icon(CupertinoIcons.create),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CupertinoSearchTextField(),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
