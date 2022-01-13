import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  Widget build(BuildContext context) {
    final todoBox =  Hive.box('todos');
    todoBox.watch();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      child: todoBox.isNotEmpty ?  ListView.builder(itemCount: todoBox.length,
          itemBuilder: (BuildContext ctx, index){

        final todoItems = todoBox.getAt(index) as Todo;
        final dynamic currentTime = DateFormat.jm().format(todoItems.date);


        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(todoItems.item,
              style: TextStyle(fontWeight: FontWeight.bold,
                  decoration:todoItems.completed ? TextDecoration.lineThrough
                      : TextDecoration.none,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.red
              ),),
            subtitle: Text(todoItems.description,
              style: TextStyle(decoration:todoItems.completed ?
              TextDecoration.lineThrough
                    : TextDecoration.none,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.red
              ),),
            leading: IconButton(onPressed: (){
              setState(() {
                todoItems.toogleComplete();
              });
            },
                icon: Icon(todoItems.completed ?
                Icons.check_box : Icons.check_box_outline_blank )),
            trailing:Row(children: [Text(currentTime),
              IconButton(icon: const Icon(Icons.delete,
              color: Colors.red,),
              onPressed: (){
                setState(() {
                  todoBox.deleteAt(index);
                });
              },)],) ,
          ),
        );
          }):
          const Center(
            child: Text('Oops!!! Your Todo is very Empty',
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
          )
    );
  }
}
