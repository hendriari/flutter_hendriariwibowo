import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1/badge.dart';
import 'package:task_1/barcode.dart';

class BottomNavbars extends StatefulWidget {
  const BottomNavbars({Key? key}) : super(key: key);

  @override
  State<BottomNavbars> createState() => _BottomNavbarsState();
}

int currentIndex = 0;

class _BottomNavbarsState extends State<BottomNavbars> {
  int _currentIndex = currentIndex;

  final List<Widget> page = [
    const Barcodes(),
    const BadgePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Barcode',
            icon: Icon(CupertinoIcons.barcode),
          ),
          BottomNavigationBarItem(
            label: 'Badge',
            icon: Icon(CupertinoIcons.app_badge_fill),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(child: page[_currentIndex]),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(80, 90),
              ),
            ),
            child: const Center(
              child: Text(
                'Package Management',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
