import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todolist_clean/features/todolist/presentation/bindins/todo_list_binding.dart';

import '../../features/maketodo/presentation/binding/make_todo_bindings.dart';
import '../../features/maketodo/presentation/make_todo_screen.dart';
import '../../features/splash/presentation/binding/splash_binding.dart';
import '../../features/splash/presentation/screen/slpash_screen.dart';
import '../../features/todolist/presentation/screens/todo_list_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String makeTodo = '/makeTodo';
  static const String todoList = '/todoList';

  static List<GetPage> get pages => [
        GetPage(
          name: splash,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: makeTodo,
          page: () => const MakeTodoScreen(),
          binding: MakeTodoBindings(),
        ),
        GetPage(
          name: todoList,
          page: () =>  TodoListScreen(),
          binding: TodoListBinding(),
        ),
      ];
}
