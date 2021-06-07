
import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:tests/features/tmdb/domain/entity/person_entity.dart';
import '../repository/TmdbRepository.dart';

class GetSearchArtistUseCase implements UseCase<Artist,ArtistSearchParams > {

  final TmdbRepository tmdbRepository;

  const GetSearchArtistUseCase({ required this.tmdbRepository });

  @override
  Future<Either<Failure, Artist>> call(ArtistSearchParams params) async{
    return await tmdbRepository.getSearchArtist(params.searchText);
  }

}

class ArtistSearchParams extends Params {
  final String searchText;

  ArtistSearchParams({ required  this.searchText}) : super(object: searchText);

}