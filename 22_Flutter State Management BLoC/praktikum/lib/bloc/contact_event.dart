import 'package:equatable/equatable.dart';
import 'package:praktikum/models/contact_model.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddContact extends ContactEvent {
  final ContactModel contacts;

  AddContact({
    required this.contacts,
  });
}

class DeleteContact extends ContactEvent {
  final ContactModel contacts;

  DeleteContact({
    required this.contacts,
  });
}
