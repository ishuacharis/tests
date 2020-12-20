part of 'internet_bloc.dart';


abstract class InternetBlocState extends Equatable {
  final ConnectionType connectionType;
  const InternetBlocState({this.connectionType});
  List<Object> get props => [connectionType];
}

class InternetLoadingState extends InternetBlocState {

  @override
  List<Object> get props => [];
}

class InternetConnectedState extends InternetBlocState {
  final ConnectionType connectionType;
  const InternetConnectedState({this.connectionType}) : super(connectionType: connectionType);
  @override
  List<Object> get props => [connectionType];
}

class InternetDisconnectedState extends InternetBlocState {
  final ConnectionType connectionType;
  const InternetDisconnectedState({this.connectionType}) : super(connectionType: connectionType);
  @override
  List<Object> get props => [connectionType];
}