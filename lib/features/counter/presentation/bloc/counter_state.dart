part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  final int counter;
  final bool wasIncremented;
  const CounterState({this.counter, this.wasIncremented});

  @override
  // TODO: implement props
  List<Object> get props => [counter];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}


class CounterInitialState extends CounterState{
  final int counter;
  final bool wasIncremented;
  const CounterInitialState({this.counter, this.wasIncremented}) : super(counter: counter);

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
  final bool wasIncremented;
  const IncrementCounterState({this.counter, this.wasIncremented}) : super(counter: counter, wasIncremented: wasIncremented);

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
  final bool wasIncremented;

  const DecrementCounterState({this.counter, this.wasIncremented}) : super(counter: counter, wasIncremented: wasIncremented);

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
