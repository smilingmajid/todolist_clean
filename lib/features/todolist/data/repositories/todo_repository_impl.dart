
import '../../domin/entities/todo.dart';
import '../../domin/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTodo(Todo todo) async {
    final model = TodoModel(id: todo.id, title: todo.title, isDone: todo.isDone);
    await localDataSource.addTodo(model);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return localDataSource.getTodos().map((e) =>
        Todo(id: e.id, title: e.title, isDone: e.isDone)).toList();
  }

  @override
  Future<void> toggleTodo(String id) => localDataSource.toggleTodo(id);

  @override
  Future<void> deleteTodo(String id) => localDataSource.deleteTodo(id);
}
