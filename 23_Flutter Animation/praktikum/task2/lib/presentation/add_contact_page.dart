import 'package:flutter/material.dart';
import 'package:praktik/common/color.dart';
import 'package:praktik/widget/text_form_widget.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(text: '');
    _nameController = TextEditingController(text: '');
  }

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormFields(
                controller: _nameController,
                label: const Text('Nama'),
                prefixIcon: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFields(
                controller: _numberController,
                label: const Text('Nomor Telepon'),
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
