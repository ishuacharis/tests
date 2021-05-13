import 'package:flutter/material.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/features/tmdb/presentation/widget/riverpod_artist_list_tile_widget.dart';

class RiverPodArtistListWidget extends StatelessWidget {
  final List artists;
  RiverPodArtistListWidget({ required this.artists,});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      hoverThickness: 32,
      child: ListView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) => RiverPodArtistListTile(
              artist: artists[index],
              voidCallback: () => Navigator.pushNamed(context,
                  riverpod_artist_detail_page,arguments: artists[index])
            ),
          )
      );
  }
}



