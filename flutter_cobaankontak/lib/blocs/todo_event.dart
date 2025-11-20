import 'package:equatable/equatable.dart';
import '../models/todo.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  AddTodo(this.todo);
  @override
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
  @override
  List<Object?> get props => [id];
}

class ToggleTodo extends TodoEvent {
  final String id;
  ToggleTodo(this.id);
  @override
  List<Object?> get props => [id];
}
