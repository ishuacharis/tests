import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/features/page_builder/presentation/widgets/slides_widget.dart';
import 'package:tests/features/page_builder/presentation/widgets/top_widget.dart';

class GetStartedPage extends StatelessWidget {
  final String title;

  GetStartedPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TopWidget(),
              SizedBox(height: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlatButton(
                      onPressed: () {},
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                      child: Text("Getting started"),
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account", style: TextStyle(fontSize: 18.0),),
                      FlatButton(
                          onPressed: (){},
                          child: Text("Login", style: TextStyle(fontSize: 18.0),)
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
