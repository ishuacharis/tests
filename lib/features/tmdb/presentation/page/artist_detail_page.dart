import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/tmdb/presentation/bloc/people_bloc.dart';

import '../../../../injection_container.dart';

class ArtistDetailPage extends StatelessWidget {
  final artist;

  ArtistDetailPage(this.artist);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PeopleBloc>.value(
        value: (s1<PeopleBloc>()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              //title: Text(artist["name"]),
              expandedHeight: 200.0,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(artist["name"]),
                background: Image.network(
                    "https://image.tmdb.org/t/p/w500${artist["profile_path"]}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context,index) => KnowForCard(
                      knownFor: artist['known_for'][index]
                  ),
                  childCount: artist['known_for'].length
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class KnowForCard extends StatelessWidget {
  final knownFor;
  const KnowForCard({Key? key, required this.knownFor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 35,bottom: 35),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //poster_path
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${knownFor["poster_path"]}"
                    )
                      //("assets/images/house.png")
                ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            //details
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextWidget("Title", knownFor['original_title']),
                    _buildTextWidget("Vote average", knownFor["vote_average"].toString()),
                    _buildTextWidget("Release date",knownFor["release_date"]),
                    _buildTextWidget("Vote count",knownFor["vote_count"].toString()),
                    _buildTextWidget("Popularity",knownFor["popularity"].toString()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextWidget(String field, String value) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0 , bottom: 5.0),
      child: Text("$field: $value"),
    );
  }
}
