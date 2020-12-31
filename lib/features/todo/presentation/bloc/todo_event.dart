part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  final TodoModel todoModel;
  const TodoEvent({this.todoModel});

  List<Object> get props => [todoModel];
}


class AddTodoEvent extends TodoEvent {
  final TodoModel todoModel;

  const AddTodoEvent({this.todoModel}) : super(todoModel: todoModel);

  @override
  // TODO: implement props
  List<Object> get props => [todoModel];
}

class DeleteTodoEvent extends TodoEvent {

  final TodoModel todoModel;

  const DeleteTodoEvent({this.todoModel}) : super(todoModel: todoModel);

  @override
  // TODO: implement props
  List<Object> get props => [todoModel];
}

class CompleteTodoEvent extends TodoEvent {

  final TodoModel todoModel;

  const CompleteTodoEvent({this.todoModel}) : super(todoModel: todoModel);

  @override
  // TODO: implement props
  List<Object> get props => [todoModel];
}