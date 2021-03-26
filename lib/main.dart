import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/pages/my_app.dart';
import 'features/counter/counter_observer.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp(connectivity: Connectivity(),));

}

