import '../entities/new_todo.dart';
import '../repositories/make_todo_repository.dart';

class CreateTodoUseCase {
  final MakeTodoRepository repository;

  CreateTodoUseCase(this.repository);

  Future<void> call(NewTodo todo) async {
    await repository.createTodo(todo);
  }
}
