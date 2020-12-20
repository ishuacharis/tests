
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/page/counter_aux_page.dart';
import 'package:tests/features/counter/presentation/page/counter_page.dart';

class GeneratedRoute {
  static final CounterBloc _counterBloc = CounterBloc();

  static Route<dynamic> onGeneratedRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch(routeSettings.name) {
      case counter_page:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: _counterBloc,
          child: CounterPage(title: args,),
        )
        );
      case counter_aux:
        return MaterialPageRoute(builder: (_) =>  BlocProvider.value(
          value: _counterBloc,
          child: CounterAuxPage(),
        ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text("Error Page"),
          ),
          body: Center(child: Text("Route not found"),),
        )
    );
  }

  static void dispose() {
    _counterBloc.close();
  }
}