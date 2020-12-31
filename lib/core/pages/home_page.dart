import 'package:flutter/material.dart';
import 'package:tests/core/routes/routes.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(todo_page);
                  },
                  child: Text("Todo view")
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(counter_page);
                  },
                  child: Text("Counter view")
              )
            ],
          ),
        ),
      ),
    );
  }
}