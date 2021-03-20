import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/features/todo/data/model/todo_model.dart';
import 'package:uuid/uuid.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  static const uuid = "888-rrrtt-666";

  static const List<TodoModel> todoInitial =  [TodoModel(id: uuid, name: 'empty', completed: false)];

  TodoBloc() : super(TodoInitial(todos: todoInitial));

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {

    if(event is AddTodoEvent) {
      yield* _mapAddTodoToState(event);
    } else if(event is DeleteTodoEvent) {
      _mapDeleteTodoToState(event);
    } else if(event is CompleteTodoEvent) {

    } else if(event is ToggleTodoEvent) {
      _mapToggleTodoToState(event);
    }
  }

  Stream<TodoState> _mapAddTodoToState(AddTodoEvent event) async* {
      yield TodoLoading();
      // Future.delayed(const Duration(seconds: 10), () async*{
      //
      // });
      final List<TodoModel> updatedTodos  = List.from(state.todos)..add(event.todo);
      yield TodoLoaded(todos: updatedTodos);

  }

  Stream<TodoState> _mapDeleteTodoToState(DeleteTodoEvent event) async* {
    if(state is TodoLoaded) {
      final List<TodoModel> updatedTodos  = state.todos..removeWhere((TodoModel todo) => todo.id == event.todo.id);
      //final List<TodoModel> updatedTodos  = state.todos..removeWhere((TodoModel todo) => todo.id == event.todo.id);
      yield TodoLoaded(todos: updatedTodos);
    }
  }

  Stream<TodoState> _mapToggleTodoToState(ToggleTodoEvent event) async* {
    if(state is TodoLoaded) {
      final List<TodoModel> completedTodos  = state.todos..every((TodoModel todo) => event.todo.completed);
      //final List<TodoModel> updatedTodos  = state.todos..removeWhere((TodoModel todo) => todo.id == event.todo.id);
     // yield TodoLoaded(todos: updatedTodos);
    }
  }
}
