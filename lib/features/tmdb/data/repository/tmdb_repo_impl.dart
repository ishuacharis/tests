import 'package:dartz/dartz.dart';
import 'package:tests/core/exceptions/exception.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/core/network/network_info.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_datasource.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_local_data_source.dart';

import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:tests/features/tmdb/domain/repository/TmdbRepository.dart';

class TmdbRepositoryImpl extends TmdbRepository {
  final TmdbRemoteDataSource tmdbRemoteDataSource;
  final TmdbLocalDataSource tmdbLocalDataSource;
  final NetworkInfo networkInfo;

  TmdbRepositoryImpl({
    required this.tmdbRemoteDataSource,
    required this.tmdbLocalDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, Artist>> getPeople() async {
    if(await networkInfo.hasConnection){
      print("connection");
      try{
        final allArtist  =  await tmdbRemoteDataSource.getAllPeople();
        tmdbLocalDataSource.cacheArtist(allArtist);
        return Right(allArtist);

      }on ServerException {
        return Left(ServerFailure(failure: "Please check your internet settings"));
      } on NetworkException {
        return Left(NetWorkFailure(failure: "Internal server error"));
      } on InvalidFormatException {
        return Left(InvalidFormatFailure(failure: "Please check your data"));
      } catch(e) {
        print("error ${e}");
        return Left(UnCaughtFailure(failure: e.toString()));
      }

    }else{
      print("no connection");
      try{
        final localArtist  =  await tmdbLocalDataSource.getLastCacheArtist();
        return Right(localArtist);
      } on CacheException{
        return Left(CacheFailure(failure: "Unable to cache data"));
      }
    }

  }

  @override
  Future<Artist> getPeopleRiverPod() async {

    if(await networkInfo.hasConnection){
      print("connection");
      try{
        final allArtist  =  await tmdbRemoteDataSource.getAllPeople();
        tmdbLocalDataSource.cacheArtist(allArtist);
        return allArtist;

      }on ServerException {
        throw ServerFailure(failure: "Please check your internet settings");
      } on NetworkException {
        throw NetWorkFailure(failure: "Internal server error");
      } on InvalidFormatException {
        throw InvalidFormatFailure(failure: "Please check your data");
      } catch(e) {
        print("error ${e}");
        throw UnCaughtFailure(failure: e.toString());
      }

    }else{
      print("no connection");
      try{
        final localArtist  =  await tmdbLocalDataSource.getLastCacheArtist();
        return localArtist;
      } on CacheException{
        throw CacheFailure(failure: "Unable to cache data");
      }
    }
  }

}