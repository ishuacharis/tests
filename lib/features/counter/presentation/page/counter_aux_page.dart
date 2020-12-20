

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';

class CounterAuxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Aux page"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) => Text("Counter is ${state.counter}")
            )
          ],
        ),
      ),
    );
  }
}
