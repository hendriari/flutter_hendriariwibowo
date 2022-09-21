import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktek/data/contact_model.dart';
import 'package:praktek/data/contacts_list_data.dart';
import 'package:praktek/presentation/add_contact_info.dart';
import 'package:praktek/presentation/contact_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _nameEditingController;
  late TextEditingController _numberEditingController;
  late GlobalKey<FormState> _key;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController(text: '');
    _numberEditingController = TextEditingController(text: '');
    _key = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            _header(),
            const SizedBox(
              height: 15,
            ),

            /// form search
            _formSearch(),

            /// list contact
            _listContact(),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          _bottomSheet();
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyan,
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.black38,
                blurRadius: 2,
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  /// header
  Widget _header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(70, 40),
        ),
      ),
      child: const Text(
        'Contacts',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
      ),
    );
  }

  /// search
  Widget _formSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
        cursorColor: Colors.cyan,
        decoration: InputDecoration(
          label: const Text('Search'),
          labelStyle: const TextStyle(color: Colors.cyan),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.cyan,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.cyan,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.cyan,
            ),
          ),
          focusColor: Colors.cyan,
        ),
      ),
    );
  }

  /// list contact
  Widget _listContact() {
    return ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: kontak.length,
        itemBuilder: (context, index) {
          final Contact contact = kontak[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetail(
                          kontak: contact,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(contact.image!),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          contact.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          );
        });
  }

  /// build bottom sheet
  Future _bottomSheet() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Form(
            key: _key,
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                        width: 50,
                        child: Divider(
                          color: Colors.cyan,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkResponse(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              CupertinoIcons.clear_thick,
                              color: Colors.red,
                            ),
                          ),
                          const Text(
                            'New Contact',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                Navigator.pop(context);
                              }
                            },
                            icon: const Icon(
                              CupertinoIcons.checkmark_alt,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _nameEditingController,
                        cursorColor: Colors.cyan,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'must be filled';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Name'),
                          labelStyle: const TextStyle(color: Colors.cyan),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.cyan,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.cyan,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.cyan),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _numberEditingController,
                        cursorColor: Colors.cyan,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'must be filled';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Number'),
                          labelStyle: const TextStyle(color: Colors.cyan),
                          prefixIcon: const Icon(
                            Icons.call,
                            color: Colors.cyan,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.cyan,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.cyan),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddContactInfo(),
                            ),
                          );
                        },
                        child: const Text(
                          'Add more info',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
