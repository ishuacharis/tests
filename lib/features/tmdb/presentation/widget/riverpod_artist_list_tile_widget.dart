import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/features/tmdb/presentation/riverpod/people_riverpod.dart';

class RiverPodArtistListTile extends ConsumerWidget {
  final artist;
  final VoidCallback voidCallback;
  RiverPodArtistListTile({required this.artist, required this.voidCallback});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final futureAsyncValue = watch(internetStatusProvider).data;
    return GestureDetector(
      onTap: () => voidCallback(),
      child: ListTile(
        leading: futureAsyncValue!.value.isConnected == false ?
        CircleAvatar(
          backgroundImage: AssetImage(
              "assets/images/face.png"
          ),
        )
        : CircleAvatar(
          backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w500${artist["profile_path"]}"),
        ),
        title: Text(artist["name"]),
      ),
    );
  }
}
