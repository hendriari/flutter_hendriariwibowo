import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/contact_bloc.dart';
import 'package:praktikum/bloc/contact_event.dart';
import 'package:praktikum/bloc/contact_state.dart';
import 'package:praktikum/models/contact_model.dart';
import 'package:praktikum/widget/text_from_field.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _numberController =
      TextEditingController(text: '');
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Contact'),
      ),
      body: Form(
        key: _key,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// textfieldname
                _textFieldName(),
                const SizedBox(
                  height: 10,
                ),
                _textFieldNumber(),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<ContactBloc, ContactState>(
                    builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        final contact = ContactModel(
                          name: _nameController.text,
                          number: _numberController.text,
                        );
                        context
                            .read<ContactBloc>()
                            .add(AddContact(contacts: contact));
                        return Navigator.pop(context);
                      }
                    },
                    child: const Text('Simpan'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// textFieldNama
  Widget _textFieldName() {
    return TextFormFields(
      label: const Text('Nama'),
      controller: _nameController,
    );
  }

  /// text Field Number
  Widget _textFieldNumber() {
    return TextFormFields(
      label: const Text('Nomor Telepon'),
      keyboardType: TextInputType.number,
      controller: _numberController,
    );
  }
}
