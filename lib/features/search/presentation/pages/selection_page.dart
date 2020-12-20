import 'package:flutter/material.dart';
import 'package:tests/features/search/presentation/pages/search_page.dart';

class SelectionPage extends StatefulWidget {
  final String title;
  SelectionPage({this.title});

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
    String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Navigate"),
              onPressed: () async{
                final result =  await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage())
                );
                if(result != null) {
                  setState(() {
                    text = result;
                    print(text);
                  });
                }

              },
            ),
            if(text != null) Text(text)
          ],
        )
      ),
    );
  }
}
