part of 'internet_bloc.dart';

@immutable
abstract class InternetState extends Equatable {

  final InternetStatus internetStatus;
  InternetState({required this.internetStatus});

  @override
  List get props => [internetStatus];
}

class InternetLoadingState extends InternetState {
  final InternetStatus internetStatus;

  InternetLoadingState({required this.internetStatus}) : super(internetStatus: internetStatus);

  @override
  List get props => [internetStatus];
}

class InternetConnectedState extends InternetState {
  final InternetStatus internetStatus;

  InternetConnectedState({required this.internetStatus}) : super(internetStatus: internetStatus);

  @override
  List get props => [internetStatus];
}

class InternetDisconnectedState extends InternetState {
  final InternetStatus internetStatus;

  InternetDisconnectedState({required this.internetStatus}): super(internetStatus: internetStatus);

  @override
  List get props => [internetStatus];
}