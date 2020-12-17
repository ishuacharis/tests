part of 'cubit_cubit.dart';

abstract class CounterCubitState extends Equatable {

  const CounterCubitState();

  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}


class LoadedCounterState extends CounterCubitState{
  final int counter;

  const LoadedCounterState({this.counter});

  @override
  // TODO: implement props
  List<Object> get props => [counter];


  @override
  // TODO: implement stringify
  bool get stringify => true;
}