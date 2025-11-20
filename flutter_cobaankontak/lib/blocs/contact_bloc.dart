import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_event.dart';
import 'contact_state.dart';
import '../models/contact.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<LoadContacts>((event, emit) {
      // Simulasi data awal (dalam aplikasi nyata, gunakan database)
      emit(
        ContactLoaded([
          Contact(id: '1', name: 'John Doe', phone: '123456789'),
          Contact(id: '2', name: 'Jane Doe', phone: '987654321'),
        ]),
      );
    });

    on<AddContact>((event, emit) {
      if (state is ContactLoaded) {
        final updatedContacts = List<Contact>.from(
          (state as ContactLoaded).contacts,
        )..add(event.contact);
        emit(ContactLoaded(updatedContacts));
      }
    });

    on<DeleteContact>((event, emit) {
      if (state is ContactLoaded) {
        final updatedContacts = (state as ContactLoaded).contacts
            .where((contact) => contact.id != event.id)
            .toList();
        emit(ContactLoaded(updatedContacts));
      }
    });
  }
}
