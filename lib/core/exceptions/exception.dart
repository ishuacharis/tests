
class ServerException implements Exception {

  final String error;

  ServerException({ required this.error });
}

class NetworkException implements Exception {

  final String error;

  NetworkException({ required this.error });
}

class InvalidFormatException implements Exception {

  final String error;

  InvalidFormatException({ required this.error });
}