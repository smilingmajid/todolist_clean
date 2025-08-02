import '../../domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required super.id,
    required super.title,
    required super.isCompleted,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }
}
