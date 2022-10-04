import 'package:flutter/material.dart';
import 'package:task2/model/contact_provider.dart';
import 'package:task2/widget/card_list.dart';

class ContactListPage extends StatelessWidget {
  final ContactProvider contact;

  const ContactListPage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemContact = contact.dataContact;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: itemContact.length,
        itemBuilder: (context, index) {
          final item = itemContact[index];
          return TaskItemCard(
            key: Key(item.id),
            contact: item,
            onPressed: () {
              contact.deleteContact(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 800),
                  content: Text('${item.name} berhasil di hapus'),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
