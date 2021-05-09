import 'package:dartz/dartz.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import '../../../../core/exceptions/failure.dart';

abstract class TmdbRepository {

  Future<Either<Failure, Artist>> getPeople();
  Future<Artist> getPeopleRiverPod();

}