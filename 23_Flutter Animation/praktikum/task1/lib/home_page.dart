import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool sizeContainer = false;
  double sized = 120;
  double zoom = 280;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Container'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              sizeContainer = !sizeContainer;
            });
          },
          child: Material(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: sizeContainer ? zoom : sized,
              width: sizeContainer ? zoom : sized,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://i.pinimg.com/1200x/7d/1b/15/7d1b155555adae23dc34a77be817c7c1.jpg',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
