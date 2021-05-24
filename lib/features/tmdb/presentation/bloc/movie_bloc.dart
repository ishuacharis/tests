import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tests/core/constants/enums/internet_status.dart';
import 'package:tests/core/shared/internet/bloc/connection/connection_bloc.dart';
import 'package:tests/features/tmdb/data/model/movie_model.dart';
import 'package:tests/features/tmdb/domain/usecase/get_single_movie_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieUseCase getMovieUseCase;
  ConnectionBloc connectionBloc;
  late StreamSubscription streamSubscription;
  MovieBloc({
    required GetMovieUseCase movieUseCase,
    required this.connectionBloc
}) : getMovieUseCase = movieUseCase,
        super(MovieInitial()){
    streamSubscription =  connectionBloc.stream.listen((ConnectionState internetState) {
      //monitorInternetConnection(internetState);
    });
  }

  void monitorInternetConnection(ConnectionState internetState) {
    if(internetState is InternetConnectedState &&
        internetState.internetStatus == InternetStatus.Connected ){
      add(SingleMovieEvent(isConnected: true));
    } else if(internetState is InternetDisconnectedState &&
        internetState.internetStatus == InternetStatus.Disconnected){
      add(SingleMovieEvent(isConnected: false));
    }
  }
  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if(event is GetSingleMovieEvent) {

      yield MovieLoading();
      final movie = await getMovieUseCase(MovieParams(id: event.id));
      yield movie.fold(
              (error) => MovieError(message: error.toString()),
              (data) => MovieLoaded(movie: data)
      );
    }
  }
}
