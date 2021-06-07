import 'package:dartz/dartz.dart';
import 'package:tests/features/tmdb/data/model/movie_model.dart';
import 'package:tests/features/tmdb/data/model/movies_model.dart';
import 'package:tests/features/tmdb/data/model/person_model.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import '../../../../core/exceptions/failure.dart';

abstract class TmdbRepository {

  Future<Either<Failure, Artist>> getPeople();
  Future<Either<Failure, PersonModel>> getSinglePerson(int id);
  Future<Either<Failure, Artist>> getSearchArtist(String id);
  Future<Either<Failure, MovieModel>> getSingleMovie(int id);
  Future<Either<Failure, MoviesModel>> getSearchMovies(String searchText);
  Future<Artist> getPeopleRiverPod();
  Future<MovieModel> getSingleMovieRiverPod(int id);

}