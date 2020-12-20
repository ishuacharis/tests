
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {

  @override
  void onChange(Cubit cubit, Change change) {
    // TODO: implement onChange
    print("${cubit.runtimeType} $change");
    super.onChange(cubit, change);

    print(change.currentState);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {

    print("${bloc.runtimeType} $transition");
    super.onTransition(bloc, transition);
  }


  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print("${cubit.runtimeType} ");
    super.onError(cubit, error, stackTrace);
  }
}