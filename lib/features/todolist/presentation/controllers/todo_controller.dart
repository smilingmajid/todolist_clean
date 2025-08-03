import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../domin/entities/todo.dart';
import '../../domin/repositories/todo_repository.dart';

class TodoController extends GetxController {
  final TodoRepository repository;

  TodoController(this.repository);

  var todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    todos.value = await repository.getTodos();
  }

  Future<void> addTodo(String title) async {
    final newTodo = Todo(id: const Uuid().v4(), title: title);
    await repository.addTodo(newTodo);
    await loadTodos();
  }

  Future<void> toggleTodo(String id) async {
    await repository.toggleTodo(id);
    await loadTodos();
  }

  Future<void> deleteTodo(String id) async {
    await repository.deleteTodo(id);
    await loadTodos();
  }
}
