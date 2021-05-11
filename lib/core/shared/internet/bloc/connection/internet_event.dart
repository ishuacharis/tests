part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent extends Equatable{
  final InternetStatus internetStatus;

  InternetEvent({required this.internetStatus});

    List<Object?> get props => [internetStatus];
}
class InternetConnectedEvent extends InternetEvent{
  final InternetStatus internetStatus;
  InternetConnectedEvent({required this.internetStatus}) : super(internetStatus: internetStatus);

  @override

  List<Object?> get props => [internetStatus];
}

class InternetDisconnectedEvent extends InternetEvent{

  final InternetStatus internetStatus;

  InternetDisconnectedEvent({required this.internetStatus}) : super(internetStatus: internetStatus);
  @override

  List<Object?> get props => [internetStatus];
}




