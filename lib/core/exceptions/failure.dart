

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String failure;
  const Failure({ required this.failure});
  List<Object> get props => [failure];
}


class ServerFailure extends Failure{

  final String failure;

  ServerFailure({ required this.failure }) : super(failure: failure);
}

class NetWorkFailure extends Failure{

  final String failure;

  NetWorkFailure({ required this.failure }) : super(failure: failure);
}

class InvalidFormatFailure extends Failure{

  final String failure;

  InvalidFormatFailure({ required this.failure }) : super(failure: failure);
}