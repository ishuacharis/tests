import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';

abstract class TmdbRemoteDataSource {

  Future<Artist> getAllPeople();
  Future<Artist> getAllPeopleRiverPod();

}
