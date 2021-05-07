import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterModel {

  int count;
  CounterModel(this.count);
}

class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier() : super(CounterModel(0));

  void increment() => {
    print('initial state ${state.count}'),
    state = CounterModel(state.count++),
    print('final state ${state.count++}')
  };
}

final counterProvider  = StateNotifierProvider<CounterNotifier, CounterModel>((ref){
  return CounterNotifier();
});

class CounterRiverPodPage extends ConsumerWidget {


  @override
  Widget build(BuildContext context,ScopedReader watch) {
    final CounterNotifier counterNotifier = watch(counterProvider.notifier);
    int counter  = watch(counterProvider).count;
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter river pod"),
        ),
        body: Center(
          child: Text("you have pushed this button ${counter}"),
        ),
        floatingActionButton: ProviderListener<CounterModel>(
          provider: counterProvider,
          onChange: (BuildContext context, CounterModel counterModel){
            if(counterModel.count == 4){
              final snackBar = SnackBar(
                content: Text('Yay! A SnackBar!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {
              counterNotifier.increment()
            },
          ),
        )
    );
  }
}

