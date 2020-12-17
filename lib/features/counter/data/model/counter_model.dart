
import 'package:equatable/equatable.dart';

class CounterModel extends Equatable{
  final int counter;

  const CounterModel({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}