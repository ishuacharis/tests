import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/core/navigation/bloc/navigation_bloc.dart';
import 'package:tests/core/routes/routes.dart';
import 'package:tests/features/tmdb/presentation/bloc/people_bloc.dart';
import 'package:tests/features/tmdb/presentation/widget/artist_list_tile_widget.dart';

import '../../../../injection_container.dart';

class ArtistListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (_) => s1<PeopleBloc>()..add(GetAllPeopleEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Artists"),
            actions: [
              IconButton(onPressed: () {
                showSearch(context: context, delegate: ArtistSearch());
              },
                  icon: Icon(Icons.search))
            ]
          ),
          body: buildBody(context),
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
              if(state is PeopleLoaded && state.isConnected) {
                return ArtistListWidget(
                      artists: state.people.results
                  );
              }
              else if(state is PeopleError) {
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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    final refresh = BlocProvider.of<PeopleBloc>(context);
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async => refresh.add(GetAllPeopleEvent(isConnected: true)),
      child: Scrollbar(
        hoverThickness: 32,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: artists.length,
            itemBuilder: (context, index) => ArtistListTileWidget(
                artist: artists[index],
              voidCallback: () => BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationPushName(route: artist_detail_page, params: artists[index])),
            )
        ),
      ),
    );
  }
}

class ArtistSearch extends SearchDelegate<String> {

  final artists = [
    'vin', 'ben', 'gal Galdot','rock'
  ];

  final recentArtists = [
    'vin', 'ben', 'gal Galdot'
  ];
  final recentCities = [];

 @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData themeData = Theme.of(context);
    return themeData.copyWith(
      appBarTheme: AppBarTheme(
        color: Color(0xFF94003B),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.grey,fontSize: 34.0)
        )
      )
    );
  }


  @override
  String? get searchFieldLabel => "Artists";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
      return IconButton(onPressed: (){
        close(context, query);
      }, icon: AnimatedIcon(
        progress: transitionAnimation, icon: AnimatedIcons.menu_arrow,
      ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentArtists :
    artists.where((artist) => artist.startsWith(query)).toList();
    
    return ListView.builder(
      itemCount: suggestionList.length,
        itemBuilder: (context,index) => ListTile(
          onTap: () {
            showResults(context);
          },
      leading: Icon(Icons.people),
      title: RichText(text: TextSpan(
        text: suggestionList[index].substring(0, query.length),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey)
          )
        ]
      )),
    ));
  }

}