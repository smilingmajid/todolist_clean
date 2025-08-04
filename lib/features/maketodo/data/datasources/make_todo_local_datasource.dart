import 'package:hive/hive.dart';
import '../models/new_todo_model.dart';

class MakeTodoLocalDataSource {
  final Box<NewTodoModel> box;

  MakeTodoLocalDataSource(this.box);

  Future<void> addTodo(NewTodoModel todo) async {
    await box.put(todo.id, todo);
  }
}
