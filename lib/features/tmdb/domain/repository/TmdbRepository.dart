import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/people.dart';

abstract class TmdbRepository {

  Future<Either<Failure, People>> getPeople();

}