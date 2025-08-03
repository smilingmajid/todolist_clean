import '../entities/todo.dart';

abstract class TodoRepository {
  Future<void> addTodo(Todo todo);
  Future<List<Todo>> getTodos();
  Future<void> toggleTodo(String id);
  Future<void> deleteTodo(String id);
}
