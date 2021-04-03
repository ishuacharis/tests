import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/counter/presentation/widgets/counter_widget.dart';
import '../bloc/counter_bloc.dart';

class CounterAuxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterWidget();
  }
}
