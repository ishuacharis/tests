
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/page/counter_aux_page.dart';
import 'package:tests/features/counter/presentation/page/counter_page.dart';

class GeneratedRoute {

  static Route<dynamic> onGeneratedRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch(routeSettings.name) {
      case counter_page:
        return MaterialPageRoute(builder: (_) =>CounterPage(title: args,),);
        break;
      case counter_aux:
        return MaterialPageRoute(builder: (_) =>  CounterAuxPage(),);
        break;
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

}