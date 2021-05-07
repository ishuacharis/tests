import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_remote_datasource.dart';
import 'package:tests/features/tmdb/data/repository/tmdb_repo_impl.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:http/http.dart' as http;



final artistProvider  =  FutureProvider<Artist>((ref) {
  final http.Client client = http.Client();
  final dataSource  = TmdbRemoteDataSourceImpl(client: client);
  final repo =  TmdbRepositoryImpl(tmdbRemoteDataSource: dataSource);
  final artist =  repo.getPeopleRiverPod();
  return artist;
});