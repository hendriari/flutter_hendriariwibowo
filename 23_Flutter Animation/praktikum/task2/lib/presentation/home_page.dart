import 'package:flutter/material.dart';
import 'package:praktik/presentation/add_contact_page.dart';
import 'package:praktik/widget/content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: const ContentWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) =>
                  const AddContact(),
              transitionDuration: const Duration(milliseconds: 1200),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.linearToEaseOut;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
