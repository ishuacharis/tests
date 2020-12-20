import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/features/counter/data/model/counter_model.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/cubit/cubit_cubit.dart';
import 'package:tests/features/counter/presentation/page/counter_aux_page.dart';


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
            BlocConsumer<CounterBloc,CounterState>(
              listener: (context, state) {
               if(state.wasIncremented == true){
                 Scaffold.of(context).showSnackBar(
                     SnackBar(content: Text("incremented"), duration: const Duration(milliseconds: 3000),)
                 );
               } else if(state.wasIncremented == false) {
                 Scaffold.of(context).showSnackBar(
                     SnackBar(content: Text("decremented"), duration: const Duration(milliseconds: 3000),)
                 );
               }
              },
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            BlocBuilder<CounterBloc, CounterState>(
                builder: (context,state) => Text("bloc builder ${state.counter}")
            ),
            BlocListener<CounterBloc, CounterState>(
                listener: (context,state){
                  if(state.wasIncremented == true) {
                    print(state.wasIncremented);
                  }
                },
              child: Text("bloc listens"),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed(counter_aux);
            },
                child: Text("Navigate")
            )
          ],
        ),
      ),

      floatingActionButton: buildSpeedDial(context), // This trailing comma makes auto-formatting nicer for build methods.
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
          onTap: () => BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent(counter: 1)),
          label: 'Add'
        ),
        SpeedDialChild(
            child: Icon(Icons.remove),
            onTap: () => BlocProvider.of<CounterBloc>(context).add(DecrementCounterEvent(counter: 1)),
            label: 'Sub'
        ),
      ],
    );
  }
}
