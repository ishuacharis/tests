import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/constants/enums/connection_type_enum.dart';
import '../../../../core/shared/internet/cubit/internet_cubit.dart';
part 'cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit}) : super(CounterInitialState(counter: 20)) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
          increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
          decrement();
      }
    });
  }

  void increment() {
    emit(CounterIncrementedState(counter: state.counter +  1));
  }

  void decrement() {
    emit(CounterDecrementedState(counter: state.counter - 1));
  }

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}