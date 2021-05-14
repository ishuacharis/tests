
import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/auth/data/models/UserModel.dart';
import 'package:tests/features/auth/domain/repository/auth_repository.dart';

class AuthLoginUseCase extends UseCase<UserModel, UserParams> {

  final AuthRepository authRepository;
  AuthLoginUseCase( { required this.authRepository });
  @override
  Future<Either<Failure, UserModel>> call(UserParams params) async {
    return await authRepository.login(params.userObject);
  }
  
}