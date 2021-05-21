import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MovieDetailPage extends StatelessWidget {
  final movie;
  const MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${movie["poster_path"]}"
                    )
                ),
                gradient: LinearGradient(
                  begin: Alignment.center,
                    end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFB03164),
                    Color(0xFFDE729D)
                  ]
                )
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFB03164),
                          Color(0xFFDE729D)
                        ]
                      )
                    ),
                    height: 200,
                    width: 300,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0) ,
                            child: Text("Title: ${movie["original_title"]}", style: Theme.of(context).textTheme.headline3,)),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0) ,
                            child: Text("Language: ${movie["original_language"]}", style: Theme.of(context).textTheme.headline3,)),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0) ,
                            child: Text("Vote average: ${movie["vote_average"]}".toString(), style: Theme.of(context).textTheme.headline3,)),
                      ],
                    ),
                  ),
                  Align(
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      child: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => print("close")
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Theme.of(context).accentColor
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("show"),
        child: Icon(Icons.add),
      ),
    );
  }
}
