
import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/domain/entity/movie_entity.dart';
import '../repository/TmdbRepository.dart';

class GetSearchMovieUseCase implements UseCase<MovieEntity,MovieSearchParams > {

  final TmdbRepository tmdbRepository;

  const GetSearchMovieUseCase({ required this.tmdbRepository });

  @override
  Future<Either<Failure, MovieEntity>> call(MovieSearchParams params) async {
    return await tmdbRepository.getSearchMovies(params.searchText);
  }



}

class MovieSearchParams extends Params {
  final String searchText;

  MovieSearchParams({ required  this.searchText}) : super(object: searchText);

}