import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:praktek/presentation/list_people.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: sizeHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.overlay),
                image: const AssetImage(
                  'assets/images/bikini_bottom.jpg',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 100,
              width: 50,
              child: InkWell(
                onTap: () {},
                child: Lottie.asset(
                  'assets/json/swipes.json',
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width / 2 - 48,
              child: InkWell(
                onTap: () {
                  _botomSheet();
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/spb.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              )),
          Positioned(
            top: 60,
            left: 30,
            right: 30,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset(
                'assets/json/jelly_fish.json',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _botomSheet() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 50,
                height: 10,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hello My Friend, I\'am Poseidon',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Text(
                'Let\'s get to know the Bikini Bottom people',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .35,
                child: Image.asset(
                  'assets/images/poseidon.png',
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 4),
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                        )
                      ]),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PeopleBikiniBottomList(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
