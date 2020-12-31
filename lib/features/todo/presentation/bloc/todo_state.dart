part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final TodoModel todoModel;
  const TodoState({this.todoModel});
  @override
  List<Object> get props => [todoModel];
}

class TodoInitial extends TodoState {
  final TodoModel todoModel;
  const TodoInitial({this.todoModel}): super(todoModel: todoModel);
  @override
  List<Object> get props => [todoModel];
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoError extends TodoState{
  @override
  List<Object> get props => [];
}