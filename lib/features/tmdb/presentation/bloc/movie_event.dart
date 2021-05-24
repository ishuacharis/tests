part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {

  List<Object?> get props => [];
}

class GetSingleMovieEvent extends MovieEvent{
  final int id;
  GetSingleMovieEvent({ required this.id,});
}

class SingleMovieEvent extends MovieEvent{
  final bool isConnected;
  SingleMovieEvent({ this.isConnected = false,});
}