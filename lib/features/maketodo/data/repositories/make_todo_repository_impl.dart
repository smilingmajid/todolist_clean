import '../../domin/entities/new_todo_entity.dart';
import '../../domin/repositories/make_todo_repository.dart';
import '../datasources/make_todo_local_datasource.dart';
import '../models/new_todo_model.dart';

class NewTodoRepositoryImpl implements NewTodoRepository {
  final NewTodoLocalDataSource localDataSource;

  NewTodoRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTodo(NewTodoEntity todo) async {
    final model = NewTodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isDone: todo.isDone,
    );
    await localDataSource.addTodo(model);
  }

  @override
  List<NewTodoEntity> getAllTodos() {
    return localDataSource.getAllTodos().map((todo) {
      return NewTodoEntity(
        id: todo.id,
        title: todo.title,
        description: todo.description,
        isDone: todo.isDone,
      );
    }).toList();
  }

  @override
  Future<void> deleteTodo(String id) async {
    await localDataSource.deleteTodo(id);
  }
}
