import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/features/tmdb/presentation/widget/riverpod_artist_list_widget.dart';
import '../riverpod/people_riverpod.dart';

class RiverPodArtistListPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final futureAsyncValue =  watch(artistInternetProvider);
    //watch(artistProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: Center(
          child: futureAsyncValue.when(
              data: (data) {
                return RiverPodArtistListWidget(
                  artists: data.artist.results,
                  voidCallback: () => print('river pod'),
                );
              },
              loading: () => CircularProgressIndicator(),
              error: (e,stack) => Text("error is $e")),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => print("wale")
          ),
        ),
      );
  }


}








