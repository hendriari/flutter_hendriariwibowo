import 'package:flutter/material.dart';
import 'package:flutter_layout/data/common/village_child.dart';
import 'package:flutter_layout/data/model/konoha_model.dart';

class VillageChild extends StatelessWidget {
  const VillageChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            _header(),
            _content(),
          ],
        ),
      ),
    );
  }

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
          'Bibit Unggul',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }

  Widget _content() {
    return GridView.builder(
      shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: childVillage.length,
        itemBuilder: (context, index) {
          final WargaKonohaModel childs = childVillage[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(childs.image),
                radius: 50,
              ),
              Text(childs.name)
            ],
          );
        });
  }
}
