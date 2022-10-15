import 'package:flutter/cupertino.dart';
import 'package:praktikum/src/model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final List<ContactModel> _dataContact = [];
  List<ContactModel> get dataContact => _dataContact;


  void addContact(ContactModel contact) {
    _dataContact.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    _dataContact.removeAt(index);
    notifyListeners();
  }
}
