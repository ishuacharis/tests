import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/data/model/movie_model.dart';
import 'package:tests/features/tmdb/data/model/person_model.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:tests/features/tmdb/domain/entity/movie_entity.dart';
import 'package:tests/features/tmdb/domain/entity/person_entity.dart';
import '../../data/model/people.dart';

import '../repository/TmdbRepository.dart';

class GetMovieUseCase implements UseCase<MovieEntity, MovieParams> {

  final TmdbRepository tmdbRepository;

  const GetMovieUseCase({ required this.tmdbRepository });

  @override
  Future<Either<Failure, MovieModel>> call(MovieParams params) async {
    return await tmdbRepository.getSingleMovie(params.id);
  }
}

class MovieParams extends Params {
  final int id;
  MovieParams({ required  this.id}) : super(object: id);

}