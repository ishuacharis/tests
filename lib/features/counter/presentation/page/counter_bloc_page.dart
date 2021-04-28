import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tests/core/shared/internet/bloc/internet_bloc.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/cubit/counter_cubit.dart';


class CounterBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CountBlocViewWidget();
  }



}

class CountBlocViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Bloc View"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc,CounterState>(
                builder: (context, state) {
                  return Text(
                    'CounterBloc ${state.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ],
          )
      ),
      floatingActionButton: buildSpeedDial(context),
    );
  }

  SpeedDial buildSpeedDial(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.list_view,
      animatedIconTheme: IconThemeData(size: 22.0),
      closeManually: true,
      children: [
        SpeedDialChild(
            child: Icon(Icons.add),
            onTap: () => context.read<CounterBloc>().add(IncrementCounterEvent(counter: 10)),
            label: 'Add'
        ),
        SpeedDialChild(
            child: Icon(Icons.remove),
            onTap: () => context.read<CounterBloc>().add(DecrementCounterEvent(counter: 5)),
            label: 'Sub'
        ),
      ],
    );
  }
}

