import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future <bool> get hasConnection;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});

  @override

  Future<bool> get hasConnection => internetConnectionChecker.hasConnection ;

}