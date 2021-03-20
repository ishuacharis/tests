

import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String name;
  final bool completed;
  const TodoModel({this.id, this.name, this.completed = false});

  TodoModel copyWith({String id, String name, bool completed}) {
    return TodoModel(
      name: name?? this.name,
      id: id?? this.id,
      completed: completed?? this.completed
    );
  }

  @override
  List<Object> get props => [id, name, completed];

  @override
  bool get stringify => true;

}