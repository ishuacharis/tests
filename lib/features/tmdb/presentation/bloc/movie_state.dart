part of 'movie_bloc.dart';


abstract class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
class MovieLoaded extends MovieState {
  final MovieModel movie;
  MovieLoaded({required this.movie });
}
class MovieError extends MovieState {
  final String message;

  MovieError({required this.message});

  @override
  List<Object> get props => [message];
}