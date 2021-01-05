part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  final TodoModel todo;
  const TodoEvent({this.todo});

  List<Object> get props => [todo];
}


class AddTodoEvent extends TodoEvent {
  final TodoModel todo;

  AddTodoEvent({this.todo}) : super(todo: todo);

  @override
  // TODO: implement props
  List<Object> get props => [todo];

  @override
  String toString() => "AddTodoEvent {todo: $todo}"  ;
}

class DeleteTodoEvent extends TodoEvent {

  final TodoModel todo;

  const DeleteTodoEvent({this.todo}) : super(todo: todo);

  @override
  // TODO: implement props
  List<Object> get props => [todo];

  @override
  String toString() => "DeletedTodoEvent {todo: $todo}"  ;
}

class CompleteTodoEvent extends TodoEvent {

  final TodoModel todo;

  const CompleteTodoEvent({this.todo}) : super(todo: todo);

  @override
  // TODO: implement props
  List<Object> get props => [todo];

  @override
  String toString() => "CompleteTodoEvent {todo: $todo}"  ;
}

class ToggleTodoEvent extends TodoEvent {
  final TodoModel todo;

  const ToggleTodoEvent({this.todo}) : super(todo: todo);

  @override
  // TODO: implement props
  List<Object> get props => [todo];

  @override
  String toString() => "ToggleTodoEvent {todo: $todo}"  ;
}