

import 'package:dartz/dartz.dart';
import 'package:tests/core/exceptions/exception.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tests/features/auth/data/models/UserModel.dart';
import 'package:tests/features/auth/domain/entities/UserEntity.dart';
import 'package:tests/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDatasource autRemoteDatasource;

  AuthRepositoryImpl({ required this.autRemoteDatasource });

  @override
  Future<Either<Failure, UserModel>> login(UserEntity userEntity) async {
    try{
      final user  =  await autRemoteDatasource.login(userEntity);
      return Right(user);

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

  @override
  Future<Either<Failure, UserModel>> register(UserEntity userEntity) async {
    try{
      final user  =  await autRemoteDatasource.register(userEntity);
      return Right(user);

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