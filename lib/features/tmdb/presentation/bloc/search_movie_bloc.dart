import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/data/model/movies_model.dart';
import 'package:tests/features/tmdb/domain/usecase/get_movie_search_usecase.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovieUseCase getSearchMovieUseCase;

  SearchMovieBloc({
    required GetSearchMovieUseCase searchMovieUseCase
  }) :    getSearchMovieUseCase = searchMovieUseCase,
        super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if(event is SearchMovieEventChanged) {
      yield SearchMovieLoading();

      final failureOrMovies  = await getSearchMovieUseCase(MovieSearchParams(searchText: "fast and furious"));
      yield* _eitherErrorOrLoaded(failureOrMovies);
    }
  }

  Stream<SearchMovieState> _eitherErrorOrLoaded(Either<Failure, MoviesModel> failureOrMovies) async* {

    yield failureOrMovies.fold(
            (failure) => SearchMovieError(message: _buildError(failure)),
            (movies) => SearchMovieLoaded(movies: movies)
    );

  }

  String _buildError(Failure failure) {
    if (failure is NetWorkFailure) return 'Check your internet settings';
    if (failure is ServerFailure) return 'Unable to connect server';
    if (failure is InvalidFormatFailure) return 'Check your data';
    return 'Uncaught error';
  }
}
