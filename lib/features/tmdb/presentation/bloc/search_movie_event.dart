part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();
}

class SearchMovieEventChanged extends SearchMovieEvent {

  final String searchText;

  SearchMovieEventChanged({required this.searchText});

  List<Object?> get props => [searchText];

}