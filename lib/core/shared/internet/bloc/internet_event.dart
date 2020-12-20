part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  final ConnectionType connectionType;
  const InternetEvent({this.connectionType});

  List<Object> get props => [connectionType];
}


class IncrementInternetEvent extends InternetEvent {
  final ConnectionType connectionType;
  const IncrementInternetEvent({this.connectionType});

  List<Object> get props => [connectionType];
}


class  DecrementInternetEvent extends InternetEvent {
  final ConnectionType connectionType;
  const DecrementInternetEvent({this.connectionType});

  List<Object> get props => [connectionType];
}


