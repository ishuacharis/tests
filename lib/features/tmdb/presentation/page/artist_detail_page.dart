import 'package:flutter/material.dart';


class ArtistDetailPage extends StatelessWidget {
  final artist;

  ArtistDetailPage(this.artist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist),
      ),
      body: Center(
        child: Text("${artist} detail"),
      ),
    );
  }
}
