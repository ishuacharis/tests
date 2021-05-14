import 'package:dartz/dartz.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/auth/data/models/UserModel.dart';
import 'package:tests/features/auth/domain/entities/UserEntity.dart';

abstract class AuthRepository {
  Future<Either<Failure,UserModel>> login(UserEntity userEntity);
  Future<Either<Failure,UserModel>> register(UserEntity userEntity);
}