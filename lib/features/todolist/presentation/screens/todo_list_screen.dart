import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_controller.dart';
    
class TodoListScreen extends StatelessWidget {

  TodoListScreen({ super.key });
  final TextEditingController textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(title: const Text("ToDo List")),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: "Enter task",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.addTodo(textController.text);
              textController.clear();
            },
            child: const Text("Add"),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  final todo = controller.todos[index];
                  return ListTile(
                    title: Text(todo.title,
                        style: TextStyle(
                            decoration:
                                todo.isDone ? TextDecoration.lineThrough : null)),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) => controller.toggleTodo(todo.id),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.deleteTodo(todo.id),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}