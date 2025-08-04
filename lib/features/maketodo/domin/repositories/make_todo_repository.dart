import '../entities/new_todo_entity.dart';

abstract class NewTodoRepository {
  Future<void> addTodo(NewTodoEntity todo);
  List<NewTodoEntity> getAllTodos();
  Future<void> deleteTodo(String id);
}
