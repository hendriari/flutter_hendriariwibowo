import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/contact_event.dart';
import 'package:praktikum/bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const LoadContact(contacts: [])) {
    on<ContactEvent>((event, emit) {
      emit(LoadContact(contacts: state.contacts));

      if (event is AddContact) {
        emit(LoadContact(contacts: [...state.contacts, event.contacts]));
      }

      if (event is DeleteContact) {
        emit(
            LoadContact(contacts: [...state.contacts]..remove(event.contacts)));
      }
    });
  }
}
