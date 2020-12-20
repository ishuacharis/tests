
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityInfo{
  Stream<ConnectivityResult> onConnectivityChanged;
}

class ConnectivityInfoImpl extends ConnectivityInfo {
  final Connectivity connectivity;
  ConnectivityInfoImpl({this.connectivity});

  Stream<ConnectivityResult> get onConnectivityChanged => connectivity.onConnectivityChanged;
}