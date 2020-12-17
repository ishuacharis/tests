import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/features/counter/data/model/counter_model.dart';

part 'cubit_state.dart';

class CounterCubit extends Cubit<CounterModel> {

  CounterCubit() : super(CounterModel(counter: 20));

  void increment() {
    emit(CounterModel(counter: state.counter +  1));
  }

  void decrement() {
    emit(CounterModel(counter: state.counter - 1));
  }
}