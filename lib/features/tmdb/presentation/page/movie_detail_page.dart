import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests/features/tmdb/presentation/bloc/movie_bloc.dart';
import 'package:tests/injection_container.dart';

class MovieDetailPage extends StatelessWidget {
  final movie;
  const MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => s1<MovieBloc>()..add(GetSingleMovieEvent(id: movie['id'],)),
    child: Scaffold(
      body: SafeArea(
        child:
            BlocBuilder<MovieBloc,MovieState>(
                builder: (context,state) {
                  if(state is MovieLoaded) {
                    return MovieContainer(state.movie);
                  }
                  else if(state is MovieError) {
                    return Center(child: Text(state.message));
                  }else if(state is MovieLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(child: Text("hello"));
                })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<MovieBloc>(context).add(GetSingleMovieEvent(id: movie["id"])),
            //print("show"),
        child: Icon(Icons.add),
      ),
    ),);
  }
}


class MovieContainer extends StatelessWidget {
  final movie;
  const MovieContainer(this.movie) ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                )
            ),
          ),
        ),
        MovieSummaryCars(movie: movie,)
      ],
    );
  }
}

class MovieSummaryCars extends StatelessWidget {
  final movie;
  const MovieSummaryCars({Key? key , required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      left: 20.0,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment. topRight,
                    colors: [
                      Color(0xFFB03164),
                      Color(0xFF1E020D)
                    ]
                )
            ),
            height: 200,
            width: 300,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0) ,
                    child: Text("Title: ${movie.originalTitle}", style: Theme.of(context).textTheme.headline4,)),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0) ,
                    child: Text("Language: ${movie.originalLanguage}", style: Theme.of(context).textTheme.headline5,)),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0) ,
                    child: Text("Vote average: ${movie.voteAverage}".toString(), style: Theme.of(context).textTheme.headline5,)),
              ],
            ),
          ),
          Align(
            child: Container(
              width: 50.0,
              height: 50.0,
              child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => print("close")
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Theme.of(context).accentColor
              ),
            ),
          )
        ],
      ),
    );
  }
}

