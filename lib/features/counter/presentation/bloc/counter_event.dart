part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable{
  final int  counter;
  const CounterEvent({this.counter});

  @override
  List<Object> get props => [];
}


class IncrementCounterEvent extends CounterEvent {
  final int counter;
  const IncrementCounterEvent({this.counter}) : super(counter: counter);

  @override
  List<Object> get props => [counter];
}

class DecrementCounterEvent extends CounterEvent {
  final int counter;
  const DecrementCounterEvent({this.counter}) : super(counter: counter);

  @override
  List<Object> get props => [counter];
}