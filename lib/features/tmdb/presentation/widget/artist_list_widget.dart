import 'package:flutter/material.dart';
import 'package:tests/features/tmdb/presentation/widget/artist_list_tile_widget.dart';

class ArtistListWidget extends StatelessWidget {
  final List artists;
  final VoidCallback voidCallback;
  ArtistListWidget({ required this.artists,required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      hoverThickness: 32,
      child: ListView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) => ArtistListTileWidget(
              artist: artists[index],
              voidCallback: voidCallback,
          ),
          )
      );
  }
}