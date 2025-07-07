import '../models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  static final List<TodoModel> _todos = [];

  @override
  Future<List<TodoModel>> getTodos() async {
    return _todos;
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    _todos.add(todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
  }
}
