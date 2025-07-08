part of 'todo_bloc.dart';

abstract class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoEntity todo;
  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  DeleteTodoEvent(this.id);
}
