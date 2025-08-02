import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constans/app_routes.dart';
import 'core/theme/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'ToDoList App',
      theme: AppTheme.defaultTheme,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.makeTodo,
   
    );
  }
}