part of 'counter_cubit.dart';

abstract class CounterCubitState extends Equatable {
  final int counter;
  const CounterCubitState({required this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class CounterInitialState extends CounterCubitState{
  final int counter;

  const CounterInitialState({required this.counter}): super(counter: counter);

  @override
  // TODO: implement props
  List<Object> get props => [counter];


  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class CounterIncrementedState extends CounterCubitState{
  final int counter;

  const CounterIncrementedState({required this.counter}) : super(counter: counter);

  @override
  // TODO: implement props
  List<Object> get props => [counter];


  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class CounterDecrementedState extends CounterCubitState{
  final int counter;

  const CounterDecrementedState({required this.counter}): super(counter: counter);

  @override
  // TODO: implement props
  List<Object> get props => [counter];


  @override
  // TODO: implement stringify
  bool get stringify => true;
}