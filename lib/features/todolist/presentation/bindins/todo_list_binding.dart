import 'package:get/get.dart';
import '../../data/datasources/todo_local_data_source.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../controllers/todo_controller.dart';
import 'package:hive/hive.dart';
import '../../data/models/todo_model.dart';

class TodoListBinding extends Bindings {
  @override
  void dependencies() {
    final todoBox = Hive.box<TodoModel>('todos');
    final localDataSource = TodoLocalDataSource(todoBox);
    final repository = TodoRepositoryImpl(localDataSource);

    Get.lazyPut<TodoController>(() => TodoController(repository));
  }
}
