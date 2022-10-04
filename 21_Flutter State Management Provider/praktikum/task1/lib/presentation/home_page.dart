import 'package:flutter/material.dart';
import 'package:task1/data/model/contact_model.dart';
import 'package:task1/data/string/contact_list_data.dart';
import 'package:task1/presentation/add_contact.dart';
import 'package:task1/presentation/contact_detail.dart';

class HomePage extends StatefulWidget {
  final String? detailNames;
  final String? detailNumbers;

  const HomePage({
    Key? key,
    this.detailNames,
    this.detailNumbers}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> kontaks = kontak;

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
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) =>
                  const AddContactInfo(),
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
                            backgroundImage: NetworkImage(contact.image == null
                                ? 'https://www.freeiconspng.com/thumbs/account-icon/account-icon-33.png'
                                : contact.image!),
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
}
