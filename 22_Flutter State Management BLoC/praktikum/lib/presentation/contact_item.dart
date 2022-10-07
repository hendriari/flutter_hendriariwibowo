import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/contact_bloc.dart';
import 'package:praktikum/bloc/contact_event.dart';
import 'package:praktikum/bloc/contact_state.dart';
import 'package:praktikum/common/color.dart';

class ContactItem extends StatelessWidget {
  ContactItem({Key? key}) : super(key: key);

  final ContactBloc contactBloc = ContactBloc();

  @override
  Widget build(BuildContext context) {
    ContactBloc contactBloc = BlocProvider.of<ContactBloc>(context);
    return BlocBuilder<ContactBloc, ContactState>(
      bloc: contactBloc,
      builder: (context, state) {
        if (state.contacts.isEmpty) {
          return const Center(
            child: Text('Kontak kosong'),
          );
        }
        return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              final contact = state.contacts[index];
              return Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 48,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contact.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(contact.number),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content:
                                        const Text('Yakin untuk menghapus ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.read<ContactBloc>().add(
                                                DeleteContact(
                                                    contacts: contact),
                                              );
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Ya',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
