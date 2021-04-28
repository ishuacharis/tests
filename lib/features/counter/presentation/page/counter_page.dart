import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../../core/shared/internet/cubit/internet_cubit.dart';
import '../cubit/counter_cubit.dart';
import '../bloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  void initState() {
    // TODO: implement initState
    print('initstate');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('didchangedependecnied');
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return CounterCubitWidget();
  }
}


class CounterCubitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Cubit Only"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit,CounterCubitState>(
              builder: (context, state) {
                return Text(
                  'CounterCubit ${state.counter}',
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
            onTap: () => context.read<CounterCubit>().increment(),
            label: 'Add'
        ),
        SpeedDialChild(
            child: Icon(Icons.remove),
            onTap: () => context.read<CounterCubit>().decrement(),
            label: 'Sub'
        ),
      ],
    );
  }
}

