import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_clean/core/constans/app_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ToDoList App',


      getPages: AppRoutes.pages,
   
    );
  }
}