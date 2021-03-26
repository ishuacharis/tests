part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  final ConnectionType connectionType;
  const InternetEvent({required this.connectionType});

  List<Object> get props => [connectionType];
}


class IncrementInternetEvent extends InternetEvent {
  final ConnectionType connectionType;
  const IncrementInternetEvent({required this.connectionType}) : super(connectionType: connectionType);

  List<Object> get props => [connectionType];
}


class  DecrementInternetEvent extends InternetEvent {
  final ConnectionType connectionType;
  const DecrementInternetEvent({required this.connectionType}) : super(connectionType: connectionType);

  List<Object> get props => [connectionType];
}


