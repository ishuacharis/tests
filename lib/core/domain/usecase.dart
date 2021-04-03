import 'package:dartz/dartz.dart';
import '../exceptions/failure.dart';

abstract class UseCase<Type,Params> {

  Future<Either<Failure,Type>> call(Params params);
}


class Params {
  final object;

  const Params({ required this.object });
}