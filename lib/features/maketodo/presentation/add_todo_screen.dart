import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/new_todo_controller.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewTodoController>();

    return Scaffold(
      appBar: AppBar(title: const Text('افزودن تسک')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: controller.onTitleChanged,
              decoration: const InputDecoration(labelText: 'عنوان'),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: controller.onDescriptionChanged,
              decoration: const InputDecoration(labelText: 'توضیحات'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addTodo,
              child: const Text('ثبت تسک'),
            ),
          ],
        ),
      ),
    );
  }
}
