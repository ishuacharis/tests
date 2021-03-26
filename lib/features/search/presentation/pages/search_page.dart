import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                controller: search,
                decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder()
                ),
                onChanged: (text) => {
                },
              ),
              ElevatedButton(onPressed: (){
                  Navigator.pop(context, search.text);
              },
                child: Text("Search"),
              )
            ],
          )
        ),
      ),
    );
  }
}
