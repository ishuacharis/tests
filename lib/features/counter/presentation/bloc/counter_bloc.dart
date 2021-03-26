import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tests/core/constants/enums/connection_type_enum.dart';
import 'package:tests/core/shared/internet/bloc/internet_bloc.dart';


part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final InternetBloc internetBloc;
  late StreamSubscription internetStreamSubscription;
  static const initialState = 22 ;
  CounterBloc({required this.internetBloc}) : super(CounterInitialState(counter: initialState, wasIncremented: false)){
      internetStreamSubscription = internetBloc.listen((internetState) {
        monitorCounterValue(internetState);
      }
      );
  }

  void monitorCounterValue(InternetBlocState internetState) {
    if (internetState is InternetConnectedState &&
        internetState.connectionType == ConnectionType.Wifi) {
       add(IncrementCounterEvent(counter: 1));
    } else if (internetState is InternetConnectedState &&
        internetState.connectionType == ConnectionType.Mobile) {
      add(DecrementCounterEvent(counter: 1));
    }
  }

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
      yield IncrementCounterState(counter: state.counter + event.counter,wasIncremented: true );
    } else if(event is DecrementCounterEvent) {
      print("counter is decrease by ${event.counter}");
      yield DecrementCounterState(counter: state.counter == 0 ? state.counter : state.counter  - event.counter, wasIncremented: false);
    }
  }

  Future<void> dispose() async {
    internetStreamSubscription.cancel();
    super.close();
  }

}
