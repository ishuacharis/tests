part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {

  List<Object?> get props => throw UnimplementedError();
}

class GetSingleMovieEvent extends MovieEvent{

  final bool isConnected;
  GetSingleMovieEvent({ required this.isConnected });
}
