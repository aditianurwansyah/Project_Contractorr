import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/contact_bloc.dart';
import '../blocs/contact_event.dart';
import '../blocs/contact_state.dart';
import '../models/contact.dart';
import 'add_contact_screen.dart';

class ContactListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(LoadContacts());

    return Scaffold(
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Jumlah Contacts: ${state.contacts.length}'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) {
                      final contact = state.contacts[index];
                      return ListTile(
                        title: Text(contact.name),
                        subtitle: Text(contact.phone),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<ContactBloc>().add(
                              DeleteContact(contact.id),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddContactScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
