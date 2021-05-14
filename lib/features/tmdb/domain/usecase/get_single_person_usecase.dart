import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/data/model/person_model.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:tests/features/tmdb/domain/entity/person_entity.dart';
import '../../data/model/people.dart';

import '../repository/TmdbRepository.dart';

class GetPersonUseCase implements UseCase<PersonEntity, PersonParams> {

  final TmdbRepository tmdbRepository;

  const GetPersonUseCase({ required this.tmdbRepository });

  @override
  Future<Either<Failure, PersonModel>> call(PersonParams params) async {
    return await tmdbRepository.getSinglePerson(params.personId);
  }
}

class PersonParams extends Params {
  final int personId;
  PersonParams({ required  this.personId}) : super(object: personId);

}