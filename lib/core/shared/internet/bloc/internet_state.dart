part of 'internet_bloc.dart';


abstract class InternetBlocState extends Equatable {
  final ConnectionType connectionType;
  const InternetBlocState({required this.connectionType});
  List<Object> get props => [connectionType];
}

class InternetLoadingState extends InternetBlocState {
  final ConnectionType connectionType;
  InternetLoadingState({required this.connectionType}) : super(connectionType: connectionType);


  @override
  List<Object> get props => [];
}

class InternetConnectedState extends InternetBlocState {
  final ConnectionType connectionType;
  const InternetConnectedState({required this.connectionType}) : super(connectionType: connectionType);
  @override
  List<Object> get props => [connectionType];
}

class InternetDisconnectedState extends InternetBlocState {
  final ConnectionType connectionType;
  const InternetDisconnectedState({required this.connectionType}) : super(connectionType: connectionType);
  @override
  List<Object> get props => [connectionType];
}