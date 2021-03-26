import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/todo/data/model/todo_model.dart';
import 'package:tests/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:uuid/uuid.dart';

class AddTodoFormWidget extends StatefulWidget {

  @override
  _AddTodoFormWidgetState createState() => _AddTodoFormWidgetState();
}

class _AddTodoFormWidgetState extends State<AddTodoFormWidget> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController nameController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Form(
          key: _form,
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white,fontSize: 22.0),
                      controller: nameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0)
                      ),
                    ),
                  ),
                  BlocBuilder<TodoBloc, TodoState>(
                      builder: (context,state) =>
                        Container(
                          child: state == TodoLoading(todos: []) ? CircularProgressIndicator() :  ElevatedButton(
                            child: Text("Add"),
                            onPressed: () {
                              BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(todo: TodoModel(id: Uuid().v4(), name: nameController.text)));
                              nameController.text = '';
                              _form.currentState!.reset();
                            },
                          ),
                        )
                  )
                ],
              ),
      );
  }
}
