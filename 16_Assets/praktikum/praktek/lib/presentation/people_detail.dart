import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:praktek/data/people_model.dart';

class PeopleDetail extends StatefulWidget {
  final PeopleBikiniBottom people;

  const PeopleDetail({Key? key, required this.people}) : super(key: key);

  @override
  State<PeopleDetail> createState() => _PeopleDetailState();
}

class _PeopleDetailState extends State<PeopleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.people.image)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width / 2 - 48,
            child: SizedBox(
              height: 100,
              width: 100,
              child: InkWell(
                onTap: () {
                  _bottomSheet();
                },
                child: Lottie.asset(
                  'assets/json/burger.json',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future _bottomSheet() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.people.secondImage)),
              ),
              Text(
                widget.people.name,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'child of',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                widget.people.parent,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${widget.people.name} Quotes',
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                widget.people.quote,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.amber, width: 1.0),
                    ),
                    child: Center(
                      child: Text(
                        'Say hai to ${widget.people.name}',
                        style: const TextStyle(color: Colors.amber, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
