import 'package:equatable/equatable.dart';
import '../models/contact.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadContacts extends ContactEvent {}

class AddContact extends ContactEvent {
  final Contact contact;
  AddContact(this.contact);
  @override
  List<Object?> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final String id;
  DeleteContact(this.id);
  @override
  List<Object?> get props => [id];
}
