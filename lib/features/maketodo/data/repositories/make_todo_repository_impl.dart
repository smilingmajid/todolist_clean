
import '../../domin/entities/new_todo.dart';
import '../../domin/repositories/make_todo_repository.dart';
import '../datasources/make_todo_local_datasource.dart';
import '../models/new_todo_model.dart';
import 'package:uuid/uuid.dart';

class MakeTodoRepositoryImpl implements MakeTodoRepository {
  final MakeTodoLocalDataSource localDataSource;

  MakeTodoRepositoryImpl(this.localDataSource);

  @override
  Future<void> createTodo(NewTodo todo) async {
    final model = NewTodoModel(
      id: const Uuid().v4(),
      title: todo.title,
      description: todo.description,
    );
    await localDataSource.addTodo(model);
  }
}
