import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/counter/data/model/counter_model.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/cubit/cubit_cubit.dart';


class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,CounterState>(
              builder: (context, state) {
                if (state is IncrementCounterState) {
                  return Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent(counter: 1)),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
