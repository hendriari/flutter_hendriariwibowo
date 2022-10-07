import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/theme_bloc.dart';
import 'package:praktikum/presentation/add_contact_page.dart';
import 'package:praktikum/presentation/contact_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.light),
            onPressed: () {
              themeBloc.changeTheme();
            },
          )
        ],
      ),
      body: ContactItem(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddContactPage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
