import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tests/core/network/network_info.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_local_data_source.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_remote_datasource.dart';
import 'package:tests/features/tmdb/data/repository/tmdb_repo_impl.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:http/http.dart' as http;
class InternetStatus {
  final bool isConnected;

  InternetStatus({ this.isConnected = false  });
}
final internetStatusProvider =  StreamProvider<InternetStatus>((ref)  {
  StreamController<InternetStatus> connectionStatus = StreamController<InternetStatus>();
  final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();

  InternetStatus _getStatus(InternetConnectionStatus status) {
    switch(status){
      case InternetConnectionStatus.connected:
        return InternetStatus(isConnected: true);
      case InternetConnectionStatus.disconnected:
        return InternetStatus(isConnected: false);
      default:
        return InternetStatus(isConnected: false);
    }
  }

  internetConnectionChecker.onStatusChange.listen((InternetConnectionStatus status) {
    connectionStatus.add(_getStatus(status));
  });
  ref.onDispose(() {
    connectionStatus.close();
  });

  return connectionStatus.stream;
});

final artistProvider  =  FutureProvider.autoDispose<Artist>((ref) {
  final internetStream = ref.watch(internetStatusProvider.last);
  internetStream.then((value) => print("internet is ${value.isConnected}"));
  final http.Client client = http.Client();
  final remoteDataSource  = TmdbRemoteDataSourceImpl(client: client);
  final localDataSource  = TmdbLocalDataSourceImpl();
  final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  final netWorksInfo  = NetworkInfoImpl(internetConnectionChecker: internetConnectionChecker);
  final repo =  TmdbRepositoryImpl(
      tmdbRemoteDataSource: remoteDataSource,
      tmdbLocalDataSource: localDataSource,
      networkInfo: netWorksInfo);
  final artist =  repo.getPeopleRiverPod();
  return artist;
});
