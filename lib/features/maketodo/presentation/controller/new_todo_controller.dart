import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../domin/entities/new_todo_entity.dart';
import '../../domin/repositories/make_todo_repository.dart';

class NewTodoController extends GetxController {
  final NewTodoRepository repository;

  NewTodoController(this.repository);

  final title = ''.obs;
  final description = ''.obs;

  void onTitleChanged(String val) => title.value = val;
  void onDescriptionChanged(String val) => description.value = val;

  void addTodo() {
    if (title.value.trim().isEmpty) return;

    final todo = NewTodoEntity(
      id: const Uuid().v4(),
      title: title.value.trim(),
      description: description.value.trim(),
      isDone: false,
    );

    repository.addTodo(todo);
    clearFields();
    Get.back(); 
  }

  void clearFields() {
    title.value = '';
    description.value = '';
  }
}
