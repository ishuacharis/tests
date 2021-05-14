import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/features/auth/domain/entities/UserEntity.dart';
import '../exceptions/failure.dart';

abstract class UseCase<Type,Params> {

  Future<Either<Failure,Type>> call(Params params);
}


class Params extends Equatable{
  final object;

  const Params({ required this.object });

  @override
  // TODO: implement props
  List<Object?> get props => [object];
}

class UserParams extends Params {
  final UserEntity userObject;
  UserParams({ required this.userObject }) : super(object: userObject);

}

class TimelineParams extends Params {
  final String username;
  TimelineParams({ required this.username }) : super(object: username);
}

class TwitterUserParams extends Params {
  final String username;
  TwitterUserParams({ required this.username }) : super(object: username);
}