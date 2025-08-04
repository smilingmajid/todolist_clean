import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../maketodo/data/datasources/make_todo_local_datasource.dart';
import '../../../maketodo/data/models/new_todo_model.dart';
import '../../../maketodo/data/repositories/make_todo_repository_impl.dart';

import '../../domin/usecases/create_todo_usecase.dart';
import '../controller/new_todo_controller.dart';

class MakeTodoBindings extends Bindings {
  @override
  void dependencies() {
    final box = Hive.box<NewTodoModel>('todos');
    final localDataSource = MakeTodoLocalDataSource(box);
    final repository = MakeTodoRepositoryImpl(localDataSource);
    final createTodoUseCase = CreateTodoUseCase(repository);
    Get.lazyPut<MakeTodoController>(
      () => MakeTodoController(createTodoUseCase),
    );
  }
}
