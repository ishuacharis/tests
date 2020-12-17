
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {

  @override
  void onChange(Cubit cubit, Change change) {
    // TODO: implement onChange
    print("${cubit.runtimeType} $change");
    super.onChange(cubit, change);

    print(change.currentState);
  }
}