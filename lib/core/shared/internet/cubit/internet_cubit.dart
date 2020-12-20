import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/core/constants/enums/connection_type_enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivitySubscription;

  InternetCubit({this.connectivity}) : super(InternetLoading()){
    connectivitySubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if(connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if(connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if(connectivityResult == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(InternetConnected(connectionType: _connectionType));
  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override

  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
