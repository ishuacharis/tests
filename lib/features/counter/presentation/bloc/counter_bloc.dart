import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  static const initialState = 40 ;
  CounterBloc() : super(CounterInitialState(counter: initialState));

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if(event is IncrementCounterEvent) {
      print("counter is increase by ${event.counter}");
      yield IncrementCounterState(counter: event.counter + 1);
    } else if(event is DecrementCounterEvent) {
      print("counter is decrease by ${event.counter}");
      yield DecrementCounterState(counter: event.counter - 1);
    }
  }
}
