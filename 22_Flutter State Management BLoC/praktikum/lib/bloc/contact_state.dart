import 'package:equatable/equatable.dart';
import 'package:praktikum/models/contact_model.dart';

abstract class ContactState extends Equatable {
  final List<ContactModel> contacts;

  const ContactState({required this.contacts});

  @override
  List<Object?> get props => [contacts];
}

class LoadContact extends ContactState {
  const LoadContact({required super.contacts});
}

class AddContacts extends ContactState {
  const AddContacts({required super.contacts});
}

class DeleteContacts extends ContactState {
  const DeleteContacts({required super.contacts});
}
