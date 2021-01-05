import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/features/todo/presentation/widgets/add_todo_form_widget.dart';
import 'package:tests/features/todo/presentation/widgets/todo_list_widget.dart';

class AddTodoPage extends StatefulWidget {
  final String title;

  AddTodoPage({this.title});

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add todo"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AddTodoFormWidget(),
            TodoListWidget()
          ]
        ),
      ));
  }
}
