part of 'connection_bloc.dart';

@immutable
abstract class ConnectionEvent extends Equatable{
  final InternetStatus internetStatus;

  ConnectionEvent({required this.internetStatus});

    List<Object?> get props => [internetStatus];
}
class InternetConnectedEvent extends ConnectionEvent{
  final InternetStatus internetStatus;
  InternetConnectedEvent({required this.internetStatus}) : super(internetStatus: internetStatus);

  @override

  List<Object?> get props => [internetStatus];
}

class InternetDisconnectedEvent extends ConnectionEvent{

  final InternetStatus internetStatus;

  InternetDisconnectedEvent({required this.internetStatus}) : super(internetStatus: internetStatus);
  @override

  List<Object?> get props => [internetStatus];
}




