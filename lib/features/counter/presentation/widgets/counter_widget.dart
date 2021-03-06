import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../../core/constants/enums/connection_type_enum.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/shared/internet/bloc/internet_bloc.dart';
import '../../../../core/shared/internet/cubit/internet_cubit.dart';
import '../bloc/counter_bloc.dart';


class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Stream"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit,InternetState>(
              builder: (context, state) {
                if(state is InternetConnected && state.connectionType == ConnectionType.Wifi){
                  return Text("InternetCubit wifi");
                } else if(state is InternetConnected && state.connectionType == ConnectionType.Mobile){
                  return Text("InternetCubit Phone");
                }
                return CircularProgressIndicator();
              },
            ),

            BlocConsumer<CounterBloc,CounterState>(
              listener: (context, state) {
               if(state.wasIncremented == true){
                 final _snackBar  = SnackBar(
                     content: Text("incremented"),
                   duration:  const Duration(milliseconds: 3000),

                 );
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar);
               } else if(state.wasIncremented == false) {
                 final _snackBar  = SnackBar(
                   content: Text("decremented"),
                   duration:  const Duration(milliseconds: 3000),

                 );
                 ScaffoldMessenger.of(context).showSnackBar(_snackBar);
               }
              },
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
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
              Navigator.of(context).pushNamed(counter_aux_page);
            },
                child: Text("Navigate")
            ),

            BlocBuilder<InternetBloc,InternetBlocState>(
              builder: (context, state) {
                if(state is InternetBlocState && state.connectionType == ConnectionType.Wifi){
                  return Text("InternetBloc  wifi");
                } else if(state is InternetBlocState && state.connectionType == ConnectionType.Mobile){
                  return Text("InternetBloc Phone");
                }
                return CircularProgressIndicator();
              },
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
        ),
      ),

      floatingActionButton: buildSpeedDial(context),// This trailing comma makes auto-formatting nicer for build methods.
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
