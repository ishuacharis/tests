import 'package:tests/features/tmdb/data/model/movie_model.dart';
import 'package:tests/features/tmdb/data/model/person_model.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';

abstract class TmdbRemoteDataSource {

  Future<Artist> getAllPeople();
  Future<PersonModel> getSinglePerson(int id);
  Future<MovieModel> getSingleMovie(int id);
  Future<Artist> getAllPeopleRiverPod();

}
