import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../models/todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodos>((event, emit) {
      // Simulasi data awal
      emit(
        TodoLoaded([
          Todo(id: '1', title: 'Belajar Flutter', isCompleted: false),
          Todo(id: '2', title: 'Makan Siang', isCompleted: true),
        ]),
      );
    });

    on<AddTodo>((event, emit) {
      if (state is TodoLoaded) {
        final updatedTodos = List<Todo>.from((state as TodoLoaded).todos)
          ..add(event.todo);
        emit(TodoLoaded(updatedTodos));
      }
    });

    on<DeleteTodo>((event, emit) {
      if (state is TodoLoaded) {
        final updatedTodos = (state as TodoLoaded).todos
            .where((todo) => todo.id != event.id)
            .toList();
        emit(TodoLoaded(updatedTodos));
      }
    });

    on<ToggleTodo>((event, emit) {
      if (state is TodoLoaded) {
        final updatedTodos = (state as TodoLoaded).todos.map((todo) {
          if (todo.id == event.id) {
            return todo.copyWith(isCompleted: !todo.isCompleted);
          }
          return todo;
        }).toList();
        emit(TodoLoaded(updatedTodos));
      }
    });
  }
}
