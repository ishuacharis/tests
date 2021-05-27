import 'package:flutter/material.dart';
import '../routes/routes.dart';
import "package:http/http.dart" as http;

class HomePage extends StatelessWidget {
  final String title;

  void _fetch() async {
    print("hey");

    final http.Client client = http.Client();

    final response = await client.get(Uri.parse("http://10.0.2.2:8000/api/gigs/all"));

    print(response.body);
    print(response.headers);
  }
  const HomePage({required this.title});
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
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(counter_bloc_page);
                  },
                  child: Text("Counter bloc")
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(counter_aux_page);
                  },
                  child: Text("Counter Stream")
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(counter_page),
                  child: Text("Movies")
              ),
              ElevatedButton(
                  onPressed: () => _fetch(),
                  child: Text("Network")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
