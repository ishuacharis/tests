import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        leading: BlocBuilder<PeopleBloc,PeopleState>(
          builder: (context, state) {
            if(state is PeopleLoaded) {
              if(state.isConnected) {
                return CircleAvatar(
                  backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w500${artist["profile_path"]}"),
                );
              }
              return CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/face.png"
                ),
              );
            }
            return CircleAvatar(
              backgroundImage: AssetImage("assets/images/house.png"),
            );
          }
        ),
        title: Text(artist["name"]),
      ),
    );
  }
}