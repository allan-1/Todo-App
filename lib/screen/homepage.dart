import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:todoapp/widgets/searchbutton.dart';
import 'package:todoapp/widgets/status.dart';
import 'package:todoapp/widgets/todoinput.dart';
import 'package:todoapp/widgets/todolist.dart';
import 'package:todoapp/widgets/topbar.dart';
import 'package:todoapp/models/todo.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

   void _addtodo(String item, String description){
     final newtodo = Todo( id: const Uuid().v4(),
         date: DateTime.now(), description: description, item: item,);
     setState(() {
       Hive.box('todos').add(newtodo);
     });
   }

  void _starttodo(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bctx){
      return TodoInput(addTodo: _addtodo,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App'),),
      body: SingleChildScrollView(child:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child:Column(
        children: const [TopBar(),
          SizedBox(height: 15,),
          SearchButton(),
          SizedBox(height: 10,),
          TodoStatus(),
          TodoList(),
        ],
      ))),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){_starttodo(context);},
          icon: const Icon(Icons.add_circle, size: 35,),
          label: const Text('Add new task', style: TextStyle(
            fontSize: 19
          ),)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }
}
