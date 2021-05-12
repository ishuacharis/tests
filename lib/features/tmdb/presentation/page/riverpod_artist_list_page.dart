import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/features/tmdb/presentation/widget/artist_list_widget.dart';
import '../riverpod/people_riverpod.dart';

class RiverPodArtistListPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final futureAsyncValue =  watch(artistProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: Center(
          child: futureAsyncValue.when(
              data: (data) {
                return Text("wale");
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

  buildBody(BuildContext context) {

    return Center(child: Text("hello"));
  }
}



// class ArtistListTile extends StatelessWidget {
//   final artist;
//
//   ArtistListTile({required this.artist});
//   @override
//   Widget build(BuildContext context) {
//
//     return GestureDetector(
//       onTap: () => print("riverpod"),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w500${artist["profile_path"]}"),
//         ),
//         title: Text(artist["name"]),
//       ),
//     );
//   }
// }




