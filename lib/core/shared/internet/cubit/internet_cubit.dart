import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/core/constants/enums/connection_type_enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivitySubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading(connectionType: ConnectionType.None)){
    connectivitySubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if(connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if(connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if(connectivityResult == ConnectivityResult.none){
        emitInternetDisconnected(ConnectionType.None);
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(InternetConnected(connectionType: _connectionType));
  void emitInternetDisconnected(ConnectionType _connectionType) => emit(InternetDisconnected(connectionType: _connectionType));

  @override

  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
