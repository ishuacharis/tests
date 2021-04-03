import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import '../../datasources/model/people.dart';

import '../repository/TmdbRepository.dart';

class GetAllPeopleUseCase implements UseCase<People, NoParams> {

  final TmdbRepository tmdbRepository;

  const GetAllPeopleUseCase({ required this.tmdbRepository });

  @override
  Future<Either<Failure, People>> call(NoParams params) {
    // TODO: implement call
    return tmdbRepository.getPeople();
  }
}

class NoParams {

  const NoParams();
}