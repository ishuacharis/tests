part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable{

  const CounterEvent();

  @override
  List<Object> get props => [];
}


class IncrementCounterEvent extends CounterEvent {
  final int counter;
  const IncrementCounterEvent({this.counter});

  @override
  List<Object> get props => [counter];
}

class DecrementCounterEvent extends CounterEvent {
  final int counter;
  const DecrementCounterEvent({this.counter});

  @override
  List<Object> get props => [counter];
}