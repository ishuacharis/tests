import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/tmdb/presentation/bloc/people_bloc.dart';

class NoNetworkArtistListTileWidget extends StatelessWidget {
  final artist;
  final VoidCallback voidCallback;

  NoNetworkArtistListTileWidget({required this.artist,required this.voidCallback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => voidCallback(),
      child: ListTile(
        leading: BlocBuilder<PeopleBloc,PeopleState>(
            builder: (context, state) {
                return CircleAvatar(
                  backgroundImage: AssetImage("assets/images/face.png"),
                );
            }
        ),
        title: Text(artist["name"]),
      ),
    );
  }
}