import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/core/navigation/bloc/navigation_bloc.dart';
import 'package:tests/features/tmdb/presentation/bloc/people_bloc.dart';
import '../../core/routes/routes.dart';
import '../../core/shared/internet/bloc/internet_bloc.dart';
import '../../core/shared/internet/cubit/internet_cubit.dart';
import '../../features/counter/presentation/bloc/counter_bloc.dart';
import '../../features/counter/presentation/cubit/counter_cubit.dart';
import '../../core/routes/route.dart';
import '../../injection_container.dart';

class MyApp extends StatefulWidget {
  final Connectivity connectivity;

  const MyApp({Key? key, required this.connectivity}) : super(key: key);

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
          BlocProvider<NavigationBloc>(
              create: (context) => s1<NavigationBloc>()
          ),
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
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          navigatorKey: s1<NavigationBloc>().navKey,
          initialRoute: initial_route,
          onGenerateRoute: GeneratedRoute.onGeneratedRoute,
        )
    );
  }
}

