
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppRoutes {
  static const String makeTodo = '/makeTodo';
  static const String todoList = '/todoList';

  List<GetPage> get pages => [

GetPage(

  name: AppRoutes.makeTodo,
  page: ()=>Container(),
  binding: null,

),
  GetPage(
    name: AppRoutes.todoList,
    page: ()=>Container(),
  binding: null,
  )

  ];
}
