import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tests/core/models/person.dart';
import 'core/pages/my_app.dart';
import 'features/counter/counter_observer.dart';
import 'injection_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CounterObserver();
  await FlutterConfig.loadEnvVariables();
  await di.init();
  //Directory appDocDir = await getApplicationDocumentsDirectory();
  //String appDocPath = appDocDir.path;

  //Hive.init(appDocPath);
  //Hive.registerAdapter(PersonAdapter());
  //await Hive.openBox("contacts");
  runApp(MyApp(connectivity: Connectivity(),));

}

