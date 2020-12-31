

import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final int id;
  final String name;
  const TodoModel({this.id, this.name});

  @override
  // TODO: implement props
  List<Object> get props => [id, name];

  @override
  // TODO: implement stringify
  bool get stringify => true;

}