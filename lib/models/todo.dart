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

  @HiveField(4, defaultValue: false)
  bool completed;


  Todo({
    required this.id,
    required this.date,
    required this.description,
    required this.item,
    this.completed = false,
  });

  void toogleComplete(){
    completed =! completed;
  }

}