import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/data/model/contact_model.dart';
import 'package:task1/data/string/contact_list_data.dart';
import 'package:task1/presentation/home_page.dart';

class AddContactInfo extends StatefulWidget {
  const AddContactInfo({Key? key}) : super(key: key);

  @override
  State<AddContactInfo> createState() => _AddContactInfoState();
}

class _AddContactInfoState extends State<AddContactInfo> {
  late TextEditingController _nameEditingController;
  late TextEditingController _mobileEditingController;
  late GlobalKey<FormState> _key;

  String? _detailNames;
  String? _detailMobile;

  List<Contact> kontaks = kontak;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController(text: _detailNames);
    _mobileEditingController = TextEditingController(text: _detailMobile);
    _key = GlobalKey();
  }

  void addDetailContact() {
    kontaks.add(
      Contact(
        name: _detailNames!,
        telephon: _detailMobile!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Form(
          key: _key,
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.clear_thick,
                            color: Colors.red,
                          )),
                      const Text(
                        'New Contact',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(
                                        detailNames: _detailNames!,
                                        detailNumbers: _detailMobile!,
                                      ),
                                ),
                                    (Route<dynamic> route) => false);
                            setState(() {
                              addDetailContact();
                            });
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.checkmark_alt,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.cyanAccent.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                  color: Colors.cyanAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: TextFormField(
                  controller: _nameEditingController,
                  cursorColor: Colors.cyan,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'must be filled';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _detailNames = value;
                  },
                  decoration: InputDecoration(
                    label: const Text('Name'),
                    labelStyle: const TextStyle(color: Colors.cyan),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.cyan,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.cyan,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: TextFormField(
                  controller: _mobileEditingController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.cyan,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'must be filled';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _detailMobile = value;
                  },
                  decoration: InputDecoration(
                    label: const Text('Mobile'),
                    labelStyle: const TextStyle(color: Colors.cyan),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.cyan,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.cyan,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(
                      Icons.call,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameEditingController.dispose();
    _mobileEditingController.dispose();
  }
}
