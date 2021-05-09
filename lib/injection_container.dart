import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tests/core/navigation/bloc/navigation_bloc.dart';
import 'package:tests/core/network/network_info.dart';
import 'package:tests/core/platform/connectivity_info.dart';
import 'package:tests/core/shared/internet/bloc/internet_bloc.dart';
import 'package:tests/core/shared/internet/cubit/internet_cubit.dart';
import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:tests/features/tmdb/data/datasources/tmdb_local_data_source.dart';
import 'package:tests/features/tmdb/domain/repository/TmdbRepository.dart';
import 'package:tests/features/tmdb/domain/usecase/get_people_usecase.dart';
import 'package:tests/features/tmdb/presentation/bloc/people_bloc.dart';

import 'features/counter/presentation/cubit/counter_cubit.dart';
import 'features/tmdb/data/datasources/tmdb_datasource.dart';
import 'features/tmdb/data/datasources/tmdb_remote_datasource.dart';
import 'features/tmdb/data/repository/tmdb_repo_impl.dart';

final s1 = GetIt.instance;

Future<void> init() async {

  // s1.registerFactory(() => {
  //   InternetBloc(connectivityInfoImpl: s1())
  // });
  //
  // s1.registerFactory(() => {
  //   InternetCubit(connectivity: s1())
  // });
  //
  // s1.registerFactory(() => {
  //   CounterBloc(internetBloc: s1())
  // });
  //
  // s1.registerFactory(() => {
  //   CounterCubit(internetCubit: s1())
  // });
  //
  // s1.registerLazySingleton<ConnectivityInfo>(() =>
  //     ConnectivityInfoImpl(connectivity: s1())
  // );

  //blocs
  s1.registerFactory(() => PeopleBloc(peopleUseCase: s1()) );
  s1.registerFactory(() => NavigationBloc(s1()) );
  
  s1.registerLazySingleton<TmdbRepository>(() => TmdbRepositoryImpl(
      tmdbRemoteDataSource: s1(),
      tmdbLocalDataSource: s1(),
      networkInfo: s1())
  );
  // usecases
  s1.registerLazySingleton(() => GetAllPeopleUseCase(tmdbRepository: s1()));

  //datasources
    s1.registerLazySingleton<TmdbRemoteDataSource>(() =>  TmdbRemoteDataSourceImpl(client: s1()) );
    s1.registerLazySingleton<TmdbLocalDataSource>(() => TmdbLocalDataSourceImpl());

  //core
    s1.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: s1()));

  //external
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();

  s1.registerLazySingleton(() => navigatorKey);
  s1.registerLazySingleton(() => Connectivity());
  s1.registerLazySingleton(() => sharedPreferences);
  s1.registerLazySingleton(() => http.Client());
  s1.registerLazySingleton(() => InternetConnectionChecker());


  print("loaded");
}