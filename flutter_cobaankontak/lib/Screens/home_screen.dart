import 'package:flutter/material.dart';
import 'contact_list_screen.dart';
import 'todo_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Latihan PM2'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Contacts'),
              Tab(text: 'Todos'),
            ],
          ),
        ),
        body: TabBarView(children: [ContactListScreen(), TodoListScreen()]),
      ),
    );
  }
}
