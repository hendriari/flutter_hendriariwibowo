import 'package:flutter/material.dart';
import 'package:praktek/data/people.dart';
import 'package:praktek/data/people_model.dart';
import 'package:praktek/presentation/people_detail.dart';

class PeopleBikiniBottomList extends StatelessWidget {
  const PeopleBikiniBottomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black26.withOpacity(0.9), BlendMode.dstOut),
              fit: BoxFit.cover,
              image: const NetworkImage(
                'https://i.pinimg.com/originals/ef/2a/aa/ef2aaaea837dde7fe2bc60010d971865.jpg',
              ),
            ),
          ),
        ),
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: peoples.length,
            itemBuilder: (context, index) {
              final PeopleBikiniBottom people = peoples[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PeopleDetail(people: people),
                    ),
                  );
                },
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(people.image),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        people.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    ));
  }
}
