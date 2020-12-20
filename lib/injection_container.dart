//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tests/core/platform/connectivity_info.dart';
// import 'package:tests/core/shared/internet/bloc/internet_bloc.dart';
// import 'package:tests/core/shared/internet/cubit/internet_cubit.dart';
// import 'package:tests/features/counter/presentation/bloc/counter_bloc.dart';
//
// import 'features/counter/presentation/cubit/counter_cubit.dart';
//
// final s1 = GetIt.instance;
//
// Future<void> init() async {
//
//   s1.registerFactory(() => {
//     InternetBloc(connectivityInfoImpl: s1())
//   });
//
//   s1.registerFactory(() => {
//     InternetCubit(connectivity: s1())
//   });
//
//   s1.registerFactory(() => {
//     CounterBloc(internetBloc: s1())
//   });
//
//   s1.registerFactory(() => {
//     CounterCubit(internetCubit: s1())
//   });
//
//   s1.registerLazySingleton<ConnectivityInfo>(() =>
//       ConnectivityInfoImpl(connectivity: s1())
//   );
//
//   //external
//   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//
//   s1.registerLazySingleton(() => Connectivity());
//   s1.registerLazySingleton(() => sharedPreferences);
//   print("loaded");
// }