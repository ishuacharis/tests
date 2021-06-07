import 'package:dartz/dartz.dart';
import 'package:tests/core/exceptions/exception.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/core/network/network_info.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_datasource.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_local_data_source.dart';
import 'package:tests/features/tmdb/data/model/movie_model.dart';
import 'package:tests/features/tmdb/data/model/person_model.dart';

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

  Future<MovieModel> getSingleMovieRiverPod(int id) async {

    if(await networkInfo.hasConnection) {
      print("connection");
      try{
        final movie  =  await tmdbRemoteDataSource.getSingleMovie(id);
        tmdbLocalDataSource.cacheMovie(id, movie);
        return movie;
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
    } else{
      print("no connection");
      try{
        final localMovie  =  await tmdbLocalDataSource.getLastCacheMovie(id);
        return localMovie;
      } on CacheException{
        throw CacheFailure(failure: "Unable to cache data");
      }
    }
  }

  @override
  Future<Either<Failure, PersonModel>> getSinglePerson(int person_id) async{

    try{
      final person  =  await tmdbRemoteDataSource.getSinglePerson(person_id);
      return Right(person);

    }on ServerException {
      throw Left(ServerFailure(failure: "Please check your internet settings"));
    } on NetworkException {
      throw Left(NetWorkFailure(failure: "Internal server error"));
    } on InvalidFormatException {
      throw Left(InvalidFormatFailure(failure: "Please check your data"));
    } catch(e) {
      print("error ${e}");
      throw Left(UnCaughtFailure(failure: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieModel>> getSingleMovie(int id) async{
    if(await networkInfo.hasConnection) {
      print("connection");
      try{
        final movie  =  await tmdbRemoteDataSource.getSingleMovie(id);
        tmdbLocalDataSource.cacheMovie(id, movie);
        return Right(movie);
      }on ServerException {
        throw Left(ServerFailure(failure: "Please check your internet settings"));
      } on NetworkException {
        throw Left(NetWorkFailure(failure: "Internal server error"));
      } on InvalidFormatException {
        throw Left(InvalidFormatFailure(failure: "Please check your data"));
      } catch(e) {
        print("error ${e}");
        throw Left(UnCaughtFailure(failure: e.toString()));
      }
    } else{
      print("no connection");
      try{
        final localMovie  =  await tmdbLocalDataSource.getLastCacheMovie(id);
        return Right(localMovie);
      } on CacheException{
        throw Left(CacheFailure(failure: "Unable to cache data"));
      }
    }
  }

  @override
  Future<Either<Failure, MovieModel>> getSearchMovies(String searchText) async {
    try {
      final movie = await tmdbRemoteDataSource.getSearchMovie(searchText);
      return Right(movie);
    } on ServerException {
      throw Left(ServerFailure(failure: "Please check your internet settings"));
    } on NetworkException {
      throw Left(NetWorkFailure(failure: "Internal server error"));
    } on InvalidFormatException {
      throw Left(InvalidFormatFailure(failure: "Please check your data"));
    } catch(e) {
      print("error ${e}");
      throw Left(UnCaughtFailure(failure: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PersonModel>> getSearchArtist(String searchText) async {
    try {
      final artist = await tmdbRemoteDataSource.getSearchPerson(searchText);
      return Right(artist);
    } on ServerException {
      throw Left(ServerFailure(failure: "Please check your internet settings"));
    } on NetworkException {
      throw Left(NetWorkFailure(failure: "Internal server error"));
    } on InvalidFormatException {
      throw Left(InvalidFormatFailure(failure: "Please check your data"));
    } catch(e) {
      print("error ${e}");
      throw Left(UnCaughtFailure(failure: e.toString()));
    }
  }

}