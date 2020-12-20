part of 'internet_cubit.dart';


abstract class InternetState extends Equatable {
  final ConnectionType connectionType;
  const InternetState({this.connectionType});
  @override
  List<Object> get props => [connectionType];
}

class InternetLoading extends InternetState {

  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  const InternetConnected({this.connectionType});
  @override
  List<Object> get props => [connectionType];
}

class InternetDisconnected extends InternetState {
  final ConnectionType connectionType;
  const InternetDisconnected({this.connectionType});
  @override
  List<Object> get props => [connectionType];
}

