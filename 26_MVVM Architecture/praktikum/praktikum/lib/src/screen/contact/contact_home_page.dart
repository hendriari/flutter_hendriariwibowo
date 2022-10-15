import 'package:flutter/material.dart';
import 'package:praktikum/src/screen/contact/add_contact_page.dart';
import 'package:praktikum/src/screen/contact/contact_list_page.dart';
import 'package:praktikum/src/screen/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final contacts = Provider.of<ContactProvider>(context, listen: false);
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) =>
                  AddContactPage(
                    onCreate: (contact) {
                      contacts.addContact(contact);
                      Navigator.pop(context);
                    },
                  ),
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
      ),
      body: buildContactList(),
    );
  }

  Widget buildContactList() {
    return Consumer<ContactProvider>(builder: (context, contact, child) {
      if (contact.dataContact.isNotEmpty) {
        return ContactListPage(
          contact: contact,
        );
      } else {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.people_rounded,
                  size: 40,
                ),
                Text(
                  'Tidak ada kontak',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ]),
        );
      }
    });
  }
}
