import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../domain/usecases/get_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final DeleteTodo deleteTodo;

  TodoBloc({
    required this.getTodos,
    required this.addTodo,
    required this.deleteTodo,
  }) : super(TodoInitial()) {
    on<LoadTodosEvent>((event, emit) async {
      emit(TodoLoading());
      final todos = await getTodos();
      emit(TodoLoaded(todos));
    });
    on<AddTodoEvent>((event, emit) async {
      await addTodo(event.todo);
      final todos = await getTodos();
      emit(TodoLoaded(todos));
    });
    on<DeleteTodoEvent>((event, emit) async {
      await deleteTodo(event.id);
      final todos = await getTodos();
      emit(TodoLoaded(todos));
    });
  }
}
