import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/widgets/counter_widget.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);

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
    // return BlocProvider(
    //   create: (_) => CounterCubit(),
    //   child: CounterWidget()
    // );
    return CounterWidget();
  }
}
