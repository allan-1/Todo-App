import 'package:hive/hive.dart';

part 'todo.g.dart';

enum Status{
  all,
  completed,
  uncompleted,
}

enum Priorities{
  high,
  medium,
  low,
  none
}

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String item;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final Status status;

  @HiveField(5)
  final Priorities priority;

  Todo({required this.status,
    required this.id,
    required this.date,
    required this.description,
    required this.item,
    required this.priority
  });
}