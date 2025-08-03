import '../models/todo_model.dart';
import 'package:hive/hive.dart';

class TodoLocalDataSource {
  final Box<TodoModel> box;

  TodoLocalDataSource(this.box);

  Future<void> addTodo(TodoModel todo) async {
    await box.put(todo.id, todo);
  }

  List<TodoModel> getTodos() {
    return box.values.toList();
  }

  Future<void> toggleTodo(String id) async {
    final todo = box.get(id);
    if (todo != null) {
      await box.put(id, todo.copyWith(isDone: !todo.isDone));
    }
  }

  Future<void> deleteTodo(String id) async {
    await box.delete(id);
  }
}
