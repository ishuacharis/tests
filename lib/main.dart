import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/core/platform/connectivity_info.dart';
import 'package:tests/core/routes/route.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/core/shared/internet/bloc/internet_bloc.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:tests/features/page_builder/presentation/page/get_started_page.dart';
import 'core/shared/internet/cubit/internet_cubit.dart';
import 'features/counter/counter_observer.dart';
import 'features/counter/presentation/page/counter_page.dart';
import 'features/search/presentation/pages/selection_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp(connectivity: Connectivity(),));
}

class MyApp extends StatefulWidget {
  final Connectivity connectivity;

  const MyApp({Key key, this.connectivity}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    // TODO: implement dispose
    GeneratedRoute.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
              create: (context) => InternetCubit(connectivity: widget.connectivity)
          ),
          BlocProvider<InternetBloc>(
              create: (context) => InternetBloc(connectivity: widget.connectivity)
          ),
          BlocProvider<CounterCubit>(
              create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>())
          ),
          BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(internetBloc: context.read<InternetBloc>())
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: initial_route,
          onGenerateRoute: GeneratedRoute.onGeneratedRoute,
        )
    );
  }
}

