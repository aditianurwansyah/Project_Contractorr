import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/todo_bloc.dart';
import '../blocs/todo_event.dart';
import '../models/todo.dart';
import 'package:uuid/uuid.dart';

class AddTodoScreen extends StatelessWidget {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final todo = Todo(
                  id: Uuid().v4(),
                  title: _titleController.text,
                  isCompleted: false,
                );
                context.read<TodoBloc>().add(AddTodo(todo));
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
