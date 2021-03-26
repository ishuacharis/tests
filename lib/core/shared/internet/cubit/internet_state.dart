part of 'internet_cubit.dart';


abstract class InternetState extends Equatable {
  final ConnectionType connectionType;
  const InternetState({required this.connectionType});
  @override
  List<Object> get props => [connectionType];
}

class InternetLoading extends InternetState {
  final ConnectionType connectionType;
  InternetLoading({required this.connectionType}) : super(connectionType: connectionType);


  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  const InternetConnected({required this.connectionType}) : super(connectionType: connectionType);
  @override
  List<Object> get props => [connectionType];
}

class InternetDisconnected extends InternetState {
  final ConnectionType connectionType;
  const InternetDisconnected({required this.connectionType}) : super(connectionType: connectionType);
  @override
  List<Object> get props => [connectionType];
}

