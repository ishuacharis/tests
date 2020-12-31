import 'package:flutter/material.dart';


class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Todo"),
      ),
    );
  }
}
