import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/tmdb/data/model/people.dart';
import 'package:tests/features/tmdb/presentation/bloc/people_bloc.dart';

import '../../../../injection_container.dart';

class ArtistListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => s1<PeopleBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Movies"),
          ),
          body:buildBody(context),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => BlocProvider.of<PeopleBloc>(context).add(GetAllPeopleEvent())
            ),
          ),
        ),
    );
  }

  BlocBuilder buildBody(BuildContext context) {

    return BlocBuilder<PeopleBloc,PeopleState>(
          builder: (context,state) {
            if(state is PeopleLoaded) {
              return ArtistListWidget(artists: state.people.results);
            }else if(state is PeopleError) {
              return Center(child: Text(state.message));
            }else if(state is PeopleLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: Text("hello"));
          },
        );
  }
}

class ArtistListWidget extends StatelessWidget {
  final List artists;
  ArtistListWidget({ required this.artists});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      hoverThickness: 32,
      child: ListView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) => ArtistListTile(artist: artists[index])
      ),
    );
  }
}

class ArtistListTile extends StatelessWidget {
  final artist;

  ArtistListTile({required this.artist});
  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Text(artist["id"].toString()),
      title: Text(artist["name"]),
    );
  }
}



