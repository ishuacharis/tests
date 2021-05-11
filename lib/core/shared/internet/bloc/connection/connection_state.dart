part of 'connection_bloc.dart';

@immutable
abstract class ConnectionState extends Equatable {

  final InternetStatus internetStatus;
  ConnectionState({required this.internetStatus});

  @override
  List get props => [internetStatus];
}

class InternetLoadingState extends ConnectionState {
  final InternetStatus internetStatus;

  InternetLoadingState({required this.internetStatus}) : super(internetStatus: internetStatus);

  @override
  List get props => [internetStatus];
}

class InternetConnectedState extends ConnectionState {
  final InternetStatus internetStatus;

  InternetConnectedState({required this.internetStatus}) : super(internetStatus: internetStatus);

  @override
  List get props => [internetStatus];
}

class InternetDisconnectedState extends ConnectionState {
  final InternetStatus internetStatus;

  InternetDisconnectedState({required this.internetStatus}): super(internetStatus: internetStatus);

  @override
  List get props => [internetStatus];
}