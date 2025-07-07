import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../data/datasources/todo_remote_datasource.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/todo_list.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => TodoBloc(
            getTodos: GetTodos(TodoRepositoryImpl(TodoRemoteDataSourceImpl())),
            addTodo: AddTodo(TodoRepositoryImpl(TodoRemoteDataSourceImpl())),
            deleteTodo: DeleteTodo(
              TodoRepositoryImpl(TodoRemoteDataSourceImpl()),
            ),
          )..add(LoadTodosEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('To-Do List')),
        body: const TodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final title = await showDialog<String>(
              context: context,
              builder: (context) => _AddTodoDialog(),
            );
            if (title != null && title.isNotEmpty) {
              final id = DateTime.now().millisecondsSinceEpoch.toString();
              // ignore: use_build_context_synchronously
              context.read<TodoBloc>().add(
                AddTodoEvent(
                  TodoEntity(id: id, title: title, isCompleted: false),
                ),
              );
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _AddTodoDialog extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  _AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Task'),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Task title'),
        onSubmitted: (value) => Navigator.of(context).pop(value),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(controller.text),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
