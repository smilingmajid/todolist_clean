
import 'package:get/get.dart';
import 'package:todolist_clean/features/maketodo/presentation/binding/make_todo_bindings.dart';
import 'package:todolist_clean/features/todolist/presentation/screens/todo_list_screen.dart';

import '../../features/maketodo/presentation/make_todo_screen.dart';
import '../../features/todolist/presentation/bindins/todo_list_binding.dart';
class AppRoutes {
  static const String makeTodo = '/makeTodo';
  static const String todoList = '/todoList';

 static List<GetPage> get pages => [

GetPage(

  name: AppRoutes.makeTodo,
  page: ()=>MakeTodoScreen(),
  binding: MakeTodoBindings(),

),
  GetPage(
    name: AppRoutes.todoList,
    page: ()=>TodoListScreen(),
  binding: TodoListBinding(),
  )

  ];
}
