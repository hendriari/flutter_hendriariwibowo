import 'package:flutter/material.dart';
import 'package:flutter_layout/data/common/family.dart';
import 'package:flutter_layout/data/model/konoha_model.dart';

class ListFriend extends StatelessWidget {
  const ListFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _content(),
          ],
        ),
      ),
    );
  }

  /// header
  Widget _header() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(90, 40),
          bottomRight: Radius.elliptical(90, 40),
        ),
      ),
      child: const Center(
        child: Text(
          'Sahabat Ku',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }

  /// konten
  Widget _content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: listFamily.length,
        itemBuilder: (context, index) {
          final WargaKonohaModel listFriend = listFamily[index];
          return Column(
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(listFriend.image),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listFriend.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              listFriend.slogan!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
            ],
          );
        },
      ),
    );
  }
}
