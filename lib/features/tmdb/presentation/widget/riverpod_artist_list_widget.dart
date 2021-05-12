import 'package:flutter/material.dart';
import 'package:tests/features/tmdb/presentation/widget/riverpod_artist_list_tile_widget.dart';

class RiverPodArtistListWidget extends StatelessWidget {
  final List artists;
  final VoidCallback voidCallback;
  RiverPodArtistListWidget({ required this.artists,required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      hoverThickness: 32,
      child: ListView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) => RiverPodArtistListTile(
              artist: artists[index],
          ),
          )
      );
  }
}



