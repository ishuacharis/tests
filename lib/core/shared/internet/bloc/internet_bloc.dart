import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/core/constants/enums/connection_type_enum.dart';
import 'package:tests/core/platform/connectivity_info.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetBlocState> {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;
  InternetBloc({this.connectivity}) : super(InternetLoadingState()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      monitorInternetConnection(connectivityResult);
    });
  }

  void monitorInternetConnection(ConnectivityResult connectivityResult) {
     if(connectivityResult == ConnectivityResult.wifi) {
      add(IncrementInternetEvent(connectionType: ConnectionType.Wifi));
    } else if(connectivityResult == ConnectivityResult.mobile) {
      add(IncrementInternetEvent(connectionType: ConnectionType.Mobile));
    } else if(connectivityResult == ConnectivityResult.none){
      add(DecrementInternetEvent());
    }
  }

  @override
  Stream<InternetBlocState> mapEventToState(
    InternetEvent event,
  ) async* {
    if(event is IncrementInternetEvent) {
      yield InternetConnectedState(connectionType: event.connectionType);
    } else if(event is DecrementInternetEvent) {
      yield InternetConnectedState(connectionType: event.connectionType);
    } else{
      yield InternetDisconnectedState();
    }
  }
  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
