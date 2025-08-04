import 'package:hive/hive.dart';
import '../models/new_todo_model.dart';

class NewTodoLocalDataSource {
  final Box<NewTodoModel> todoBox;

  NewTodoLocalDataSource(this.todoBox);

  Future<void> addTodo(NewTodoModel todo) async {
    await todoBox.put(todo.id, todo);
  }

  List<NewTodoModel> getAllTodos() {
    return todoBox.values.toList();
  }

  Future<void> deleteTodo(String id) async {
    await todoBox.delete(id);
  }
}
