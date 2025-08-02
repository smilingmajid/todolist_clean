import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/make_todo_controller.dart';

class MakeTodoScreen extends GetView <MakeTodoController>{

  const MakeTodoScreen({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}