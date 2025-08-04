import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constans/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'core/translations/app_translations.dart';
import 'features/maketodo/data/models/new_todo_model.dart';
import 'features/todolist/data/models/todo_model.dart';
import 'features/todolist/data/datasources/todo_local_data_source.dart';
import 'features/todolist/data/repositories/todo_repository_impl.dart';
import 'features/todolist/presentation/controllers/todo_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  final todoBox = await Hive.openBox<TodoModel>('todos');
Hive.registerAdapter(NewTodoModelAdapter());
await Hive.openBox<NewTodoModel>('todos');

  // Dependency Injection
  final localDataSource = TodoLocalDataSource(todoBox);
  final repository = TodoRepositoryImpl(localDataSource);
  Get.put<TodoController>(TodoController(repository));

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

      themeMode: ThemeMode.system,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splash,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
    );
  }
}
