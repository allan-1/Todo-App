import 'package:hive/hive.dart';

part 'todo.g.dart';


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


  Todo({
    required this.id,
    required this.date,
    required this.description,
    required this.item,
  });
}