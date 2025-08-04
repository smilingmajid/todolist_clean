import '../entities/new_todo.dart';

abstract class MakeTodoRepository {
  Future<void> createTodo(NewTodo todo);
}
