import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import '../../data/model/people.dart';

import '../repository/TmdbRepository.dart';

class GetAllPeopleUseCase implements UseCase<People, NoParams> {

  final TmdbRepository tmdbRepository;

  const GetAllPeopleUseCase({ required this.tmdbRepository });

  @override
  Future<Either<Failure, People>> call(NoParams params) async {
    return await tmdbRepository.getPeople();
  }
}

class NoParams {

  const NoParams();
}