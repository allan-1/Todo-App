import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoInput extends StatefulWidget{
  final Function addTodo;
  const TodoInput({Key? key, required this.addTodo}) : super(key: key);

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State <TodoInput> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitdata(){
    widget.addTodo(_titleController.text, _descriptionController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  )),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: TextField(
                  controller:_descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSubmitted: (_) {
                    _submitdata();
                  },
                ),
              ),
              TextButton(
                  onPressed: _submitdata,
                  child: const Text('Add Todo'))
            ],
          ),
        ));
  }
}
