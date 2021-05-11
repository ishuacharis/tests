import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:tests/core/constants/enums/internet_status.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final InternetConnectionChecker internetConnectionChecker;
  late StreamSubscription streamSubscription;

  ConnectionBloc({required this.internetConnectionChecker})
      : super(InternetLoadingState(internetStatus: InternetStatus.Disconnected)){
    streamSubscription =  internetConnectionChecker.onStatusChange.listen((InternetConnectionStatus status) {
      monitorInternetConnectionStatus(status);
    });
  }

  void monitorInternetConnectionStatus(InternetConnectionStatus status) {
     switch(status) {
      case InternetConnectionStatus.connected:
        add(InternetConnectedEvent(internetStatus: InternetStatus.Connected));
        break;
      case InternetConnectionStatus.disconnected:
        add(InternetDisconnectedEvent(internetStatus: InternetStatus.Disconnected));
        break;
    }
  }

  @override
  Stream<ConnectionState> mapEventToState(
    ConnectionEvent event,
  ) async* {
    if(event is InternetConnectedEvent) {
      yield InternetConnectedState(internetStatus: event.internetStatus);
    }else if(event is InternetDisconnectedEvent) {
      yield InternetDisconnectedState(internetStatus: event.internetStatus);
    }
  }


  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
