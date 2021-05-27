import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tests/core/network/network_info.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_local_data_source.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_remote_datasource.dart';
import 'package:tests/features/tmdb/data/model/movie_model.dart';
import 'package:tests/features/tmdb/data/repository/tmdb_repo_impl.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:http/http.dart' as http;

class InternetStatus {
  final bool isConnected;

  InternetStatus({ this.isConnected = false  });
}
class Result {
  final bool isConnected;
  final Artist artist;
  Result({ required this.artist, this.isConnected = false });
}

class Movie {
  final int id;
  Movie({ required this.id });
}

class MovieNotifier extends StateNotifier<Movie> {
  MovieNotifier() : super(Movie(id: 0));
}

final movieProvider  = StateNotifierProvider<MovieNotifier, Movie>((ref){
  return MovieNotifier();
});
//
/// This StreamProvider listens to change in internet connection status (e.g connected or disconnected)
///
/// emits the appropriate internet status stream
///
/// /
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


//
/// This FutureProvider provides a list<Artist> returned from network call to its children
///
///
/// /
final artistProvider  =  FutureProvider.autoDispose<Artist>((ref) {
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

//
/// This FutureProvider provides  Result Object return from network call but
/// it reacts or listens to stream emitted from internetStatusProvider which is
/// a stream provider
///
/// it provides different values based on streams emitted from internetStatusProvider
///
/// /

final artistInternetProvider  =  FutureProvider.autoDispose<Result>((ref) async {
  final internetStream = ref.watch(internetStatusProvider).data;
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
  Artist a =  await artist.then((value) => value);
  if(internetStream != null) {
    return Future.value(Result(artist:a, isConnected: true ));
  }

  return Future.value(Result(artist:a ));
  return Result(artist: a);
});

final movieFutureProvider  =  FutureProvider.family.autoDispose<MovieModel, int>((ref, id) {
  final http.Client client = http.Client();
  final remoteDataSource  = TmdbRemoteDataSourceImpl(client: client);
  final localDataSource  = TmdbLocalDataSourceImpl();
  final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  final netWorksInfo  = NetworkInfoImpl(internetConnectionChecker: internetConnectionChecker);
  final repo =  TmdbRepositoryImpl(
      tmdbRemoteDataSource: remoteDataSource,
      tmdbLocalDataSource: localDataSource,
      networkInfo: netWorksInfo);
  final movie =  repo.getSingleMovieRiverPod(id);
  return movie;
});