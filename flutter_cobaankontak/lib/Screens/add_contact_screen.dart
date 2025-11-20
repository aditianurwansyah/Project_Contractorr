import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/contact_bloc.dart';
import '../blocs/contact_event.dart';
import '../models/contact.dart';
import 'package:uuid/uuid.dart';

class AddContactScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final contact = Contact(
                  id: Uuid().v4(),
                  name: _nameController.text,
                  phone: _phoneController.text,
                );
                context.read<ContactBloc>().add(AddContact(contact));
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
