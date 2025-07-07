import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource dataSource;
  TodoRepositoryImpl(this.dataSource);

  @override
  Future<List<TodoEntity>> getTodos() async {
    return await dataSource.getTodos();
  }

  @override
  Future<void> addTodo(TodoEntity todo) async {
    await dataSource.addTodo(
      TodoModel(id: todo.id, title: todo.title, isCompleted: todo.isCompleted),
    );
  }

  @override
  Future<void> deleteTodo(String id) async {
    await dataSource.deleteTodo(id);
  }
}
