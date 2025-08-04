import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/new_todo_controller.dart';

class MakeTodoScreen extends GetView<MakeTodoController> {
  const MakeTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.titleCtrl,
              decoration: const InputDecoration(hintText: "title"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.descriptionCtrl,
              decoration: const InputDecoration(hintText: "description"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.createTodoAction();
              },
              child: Text("Create ToDo"),
            ),
          ],
        ),
      ),
    );
  }
}
