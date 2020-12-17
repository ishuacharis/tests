part of 'counter_bloc.dart';

@immutable
//abstract class CounterState {}

//class CounterInitial extends CounterState {}

abstract class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}


class CounterInitialState extends CounterState{
  final int counter;

  const CounterInitialState({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];


  @override
  // TODO: implement stringify
  bool get stringify => true;


  @override
  String toString() {
    // TODO: implement toString
    return "Increased to $counter";
  }
}


class IncrementCounterState extends CounterState{
  final int counter;

  const IncrementCounterState({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];


  @override
  // TODO: implement stringify
  bool get stringify => true;


  @override
  String toString() {
    // TODO: implement toString
    return "Increased to $counter";
  }
}

class DecrementCounterState extends CounterState{
  final int counter;

  const DecrementCounterState({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];


  @override
  // TODO: implement stringify
  bool get stringify => true;

  @override
  String toString() {
    // TODO: implement toString
    return "Decreased to $counter";
  }
}
