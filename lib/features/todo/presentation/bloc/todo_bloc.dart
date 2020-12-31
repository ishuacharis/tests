import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/features/todo/data/model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  static const TodoModel todoInitial =  TodoModel(id: 0, name: 'empty');
  TodoBloc() : super(TodoInitial(todoModel: todoInitial));

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {

    if(event is AddTodoEvent) {

    } else if(event is DeleteTodoEvent) {

    } else if(event is CompleteTodoEvent) {

    }
  }
}
