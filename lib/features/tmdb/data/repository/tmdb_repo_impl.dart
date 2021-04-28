import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tests/core/exceptions/exception.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_remote_datasource.dart';
import 'package:tests/features/tmdb/data/model/people.dart';
import 'package:tests/features/tmdb/domain/repository/TmdbRepository.dart';

class TmdbRepositoryImpl extends TmdbRepository {
  final TmdbRemoteDataSource tmdbRemoteDataSource;

  TmdbRepositoryImpl({ required this.tmdbRemoteDataSource });

  @override
  Future<Either<Failure, People>> getPeople() async {

    try{
      return Right(await tmdbRemoteDataSource.getAllPeople());

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
  }

}