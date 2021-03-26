import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/todo/data/model/todo_model.dart';
import 'package:tests/features/todo/presentation/bloc/todo_bloc.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc,TodoState>(
        builder: (context, state) {
            return state == TodoLoading(todos: []) ? Center(child: CircularProgressIndicator()) : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: state.todos.map((TodoModel todo) => Container(
                child: Row(
                  children: [
                    Checkbox(
                        
                        value: todo.completed,
                        tristate: false,
                        onChanged: (value) {}
                    ),
                    SizedBox(width: 20,),
                    Expanded(child: Text(todo.name, style: TextStyle(color: Colors.white, fontSize: 22.0),))
                  ],
                ),
              )).toList(),
            );
        }
    );
  }
}
