import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/make_todo_controller.dart';

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
            TextField(),
            SizedBox(height: 20),
            TextField(),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              
            }, child: Text("Create ToDo")),
          ],
        ),
      ),
    );
  }
}
