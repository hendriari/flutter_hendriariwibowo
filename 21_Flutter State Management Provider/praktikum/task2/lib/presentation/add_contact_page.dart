import 'package:flutter/material.dart';
import 'package:task2/model/contact_model.dart';
import 'package:uuid/uuid.dart';

class AddContactPage extends StatefulWidget {
  final Function(ContactModel) onCreate;

  const AddContactPage({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _nameController = TextEditingController(text: '');
  final _numberController = TextEditingController(text: '');

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _formContact(),
            const SizedBox(
              height: 16,
            ),
            _saveButton(),
          ],
        ),
      ),
    );
  }

  Widget _formContact() {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            cursorColor: Colors.blue,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text('Nama'),
              labelStyle: TextStyle(color: Colors.blue),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _numberController,
            cursorColor: Colors.blue,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nomor telepon tidak boleh kosong';
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text('Nomor Telepon'),
              labelStyle: TextStyle(color: Colors.blue),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _saveButton() {
    return ElevatedButton(
      child: const Text(
        'Simpan',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        if (_key.currentState!.validate()) {
          final itemContact = ContactModel(
            id: const Uuid().v1(),
            name: _nameController.text,
            number: _numberController.text,
          );
          widget.onCreate(itemContact);
        }
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }
}
