import 'package:get/get.dart';
import 'package:todolist_clean/features/maketodo/presentation/controller/make_todo_controller.dart';

class MakeTodoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MakeTodoController>(() => MakeTodoController());
  }
}
