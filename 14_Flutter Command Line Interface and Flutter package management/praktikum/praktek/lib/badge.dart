import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgePage extends StatefulWidget {
  const BadgePage({Key? key}) : super(key: key);

  @override
  State<BadgePage> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
  double chipPosX = 0.0;
  double chipPosY = 0.0;

  double badgePosX = 0.0;
  double badgePosY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (chipPosX == 0) {
      center(context);
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: chipPosY,
            left: chipPosX,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  double deltaX = details.delta.dx;
                  double deltaY = details.delta.dy;
                  chipPosX += deltaX;
                  chipPosY += deltaY;
                });
              },
              child: const Chip(
                padding: EdgeInsets.all(0),
                backgroundColor: Colors.deepPurple,
                label: Text('BADGE', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Positioned(
            top: badgePosY,
            left: badgePosX,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  double deltaX = details.delta.dx;
                  double deltaY = details.delta.dy;
                  badgePosX += deltaX;
                  badgePosY += deltaY;
                });
              },
              child: Badge(
                toAnimate: false,
                shape: BadgeShape.square,
                badgeColor: Colors.deepPurple,
                borderRadius: BorderRadius.circular(8),
                badgeContent:
                    const Text('BADGE', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void center(BuildContext context) {
    chipPosX = MediaQuery.of(context).size.width / 2.3;
    chipPosY = MediaQuery.of(context).size.height / 2;
    badgePosX = MediaQuery.of(context).size.width / 2.3;
    badgePosY = MediaQuery.of(context).size.height / 2.5;

    setState(() {
      chipPosX = chipPosX;
      chipPosY = chipPosY;
      badgePosX = badgePosX;
      badgePosY = badgePosY;
    });
  }
}


