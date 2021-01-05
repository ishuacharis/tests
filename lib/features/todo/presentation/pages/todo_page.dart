import 'package:flutter/material.dart';
import 'package:tests/core/routes/routes.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Page"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add), 
              onPressed: () {
                Navigator.of(context).pushNamed(add_todo_page);
              })
        ],
      ),
      body: Center(
        child: Text("Todo"),
      ),
    );
  }
}
