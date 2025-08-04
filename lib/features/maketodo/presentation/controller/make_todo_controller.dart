import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../domin/entities/new_todo.dart';
import '../../domin/usecases/create_todo_usecase.dart';

class MakeTodoController extends GetxController {
  final CreateTodoUseCase createTodoUseCase;

  MakeTodoController(this.createTodoUseCase);

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  void createTodoAction() async {
    final title = titleCtrl.text.trim();
    final description = descriptionCtrl.text.trim();

    if (title.isEmpty) return;

    final todo = NewTodo(title: title, description: description);
    await createTodoUseCase(todo);

    titleCtrl.clear();
    descriptionCtrl.clear();

    Get.snackbar("Done", "New todo created");
  }

  @override
  void onClose() {
    titleCtrl.dispose();
    descriptionCtrl.dispose();
    super.onClose();
  }
}
