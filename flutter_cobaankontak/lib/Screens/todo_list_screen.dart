import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/todo_bloc.dart';
import '../blocs/todo_event.dart';
import '../blocs/todo_state.dart';
import '../models/todo.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<TodoBloc>().add(LoadTodos());

    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            final total = state.todos.length;
            final completed = state.todos
                .where((todo) => todo.isCompleted)
                .length;
            final pending = total - completed;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Jumlah Todos: $total'),
                      Text('Sudah Selesai: $completed'),
                      Text('Belum Selesai: $pending'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        title: Text(todo.title),
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (value) {
                            context.read<TodoBloc>().add(ToggleTodo(todo.id));
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<TodoBloc>().add(DeleteTodo(todo.id));
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
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
