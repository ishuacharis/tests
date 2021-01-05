part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final List<TodoModel> todos;
  const TodoState({this.todos});
  @override
  List<Object> get props => [todos];
}

class TodoInitial extends TodoState {
  final List<TodoModel> todos;
  const TodoInitial({this.todos}): super(todos: todos);
  @override
  List<Object> get props => [todos];

  @override
  String toString() => "TodoInitial ${todos}"  ;
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];

  @override
  String toString() => "TodoLoading "  ;
}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;
  const TodoLoaded({this.todos}): super(todos: todos);
  @override
  List<Object> get props => [todos];

  @override
  String toString() => "TodoLoaded ${todos}"  ;
}

class TodoError extends TodoState{
  @override
  List<Object> get props => [];

  @override
  String toString() => "TodoError"  ;
}