import 'package:hive/hive.dart';

part 'new_todo_model.g.dart';

@HiveType(typeId: 1)
class NewTodoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final bool isDone;

  NewTodoModel({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
