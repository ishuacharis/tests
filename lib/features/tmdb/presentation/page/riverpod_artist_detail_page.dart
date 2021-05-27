import 'package:flutter/material.dart';
import 'package:tests/core/routes/routes.dart';

class RiverPodArtistDetailPage extends StatelessWidget {
  final artist;

  RiverPodArtistDetailPage(this.artist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      (context,index) =>
                          KnowForCard(
                      knownFor: artist['known_for'][index]
                  ),
                  childCount: artist['known_for'].length
              ),
            ),

          ],
        ),
      );
  }
}

class KnowForCard extends StatelessWidget {
  final knownFor;
  const KnowForCard({Key? key, required this.knownFor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, riverpod_movie_detail_page,arguments: knownFor),
      child: Card(
        color: Color(0xFF18010A),
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
                      _buildTextWidget(context,"Title", knownFor['original_title']),
                      _buildTextWidget(context,"Vote average", knownFor["vote_average"].toString()),
                      _buildTextWidget(context,"Release date",knownFor["release_date"]),
                      _buildTextWidget(context,"Vote count",knownFor["vote_count"].toString()),
                      _buildTextWidget(context,"Popularity",knownFor["popularity"].toString()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextWidget(BuildContext context,String field, String value) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0 , bottom: 5.0),
      child: Text("$field: $value", style: Theme.of(context).textTheme.headline5,),
    );
  }
}
