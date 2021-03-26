
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/core/pages/home_page.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/counter/presentation/page/counter_aux_page.dart';
import 'package:tests/features/counter/presentation/page/counter_page.dart';
import 'package:tests/features/page_builder/presentation/page/get_started_page.dart';
import 'package:tests/features/search/presentation/pages/selection_page.dart';
import 'package:tests/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:tests/features/todo/presentation/pages/add_todo_page.dart';
import 'package:tests/features/todo/presentation/pages/todo_page.dart';

class GeneratedRoute {

  static final TodoBloc _todoBloc = TodoBloc();

  static Route<dynamic> onGeneratedRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch(routeSettings.name) {
      case home_page:
        return MaterialPageRoute(builder: (_) => HomePage(title: "Home",),);
      case selection_page:
        return MaterialPageRoute(builder: (_) => SelectionPage(title: "Selection Page",),);
      case page_builder:
        return MaterialPageRoute(builder: (_) => GetStartedPage(title: "Get Started",),);
      case counter_page:
        return MaterialPageRoute(builder: (_) => CounterPage(title: args.toString(),),);
      case counter_aux_page:
        return MaterialPageRoute(builder: (_) =>  CounterAuxPage(),);
      case todo_page:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: _todoBloc,
          child: TodoPage(),
        ));

      case add_todo_page:
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: _todoBloc,
          child: AddTodoPage(title: args.toString()),
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

  static void dispose(){
    _todoBloc.close();
  }

}