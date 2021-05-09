
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {

  // @override
  // void onChange(Cubit cubit, Change change) {
  //   // TODO: implement onChange
  //   print("${cubit.runtimeType} $change");
  //   super.onChange(cubit, change);
  //
  //   print(change.currentState);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("${bloc.runtimeType} $transition");
  }


  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print("$error ");
    print("$bloc ");
    super.onError(bloc, error, stackTrace);
  }
}