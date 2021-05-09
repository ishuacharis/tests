import 'package:flutter/material.dart';
import 'package:tests/features/tmdb/presentation/bloc/people_bloc.dart';
import 'package:tests/injection_container.dart';

class ArtistListTileWidget extends StatelessWidget {
  final artist;
  final VoidCallback voidCallback;

  ArtistListTileWidget({required this.artist,required this.voidCallback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => voidCallback(),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w500${artist["profile_path"]}"),
        ),
        title: Text(artist["name"]),
      ),
    );
  }
}