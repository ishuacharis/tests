import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/core/routes/route.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/page_builder/presentation/page/get_started_page.dart';
import 'features/counter/counter_observer.dart';
import 'features/counter/presentation/page/counter_page.dart';
import 'features/search/presentation/pages/selection_page.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initial_route,
      onGenerateRoute: GeneratedRoute.onGeneratedRoute,
    );
  }
}

