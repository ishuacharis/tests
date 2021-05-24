import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tests/core/models/person.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:tests/features/twitter/data/datasource/twitter_remoate_datasource.dart';
import 'core/pages/my_app.dart';
import 'features/counter/counter_observer.dart';
import 'features/tmdb/data/model/movie_model.dart';
import 'injection_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = CounterObserver();
  await FlutterConfig.loadEnvVariables();
  await di.init();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  Hive.init(appDocPath);
  //Hive.registerAdapter(PersonAdapter());
  //await Hive.openBox("contacts");
  Hive.registerAdapter(ArtistAdapter());
  Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox("tmdb");
  runApp(
    ProviderScope(child: MyApp(connectivity: Connectivity(),))
  );

}

