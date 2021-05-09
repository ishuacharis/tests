import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import '../models/person.dart';
const boxName = "contacts";

class HiveApp extends StatefulWidget {
  @override
  _PAppState createState() => _PAppState();
}

class _PAppState extends State<HiveApp> {
  late var box;
  late Future<Box<dynamic>> futureBox;
  late Future<Directory> _dirT;
  late Future<Directory> _workingDir;
  Future<Directory?>?  pSupport;
  Future<Directory?>?  extDir;
  Future<List<Directory?>?>?  cacheDir;

  void _setTempDir() {
    setState(() {
      _dirT =  getTemporaryDirectory();
    });
  }
  void _setWorkingDir() {
    setState(() {
      _workingDir =  getApplicationDocumentsDirectory();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureBox = Hive.openBox(boxName);
    box = Hive.box(boxName);
    _setTempDir();
    _setWorkingDir();
    pSupport = getApplicationSupportDirectory();
    cacheDir = getExternalCacheDirectories();
    extDir = getExternalStorageDirectory();

    pSupport?.then((value) => print(value));
    cacheDir?.then((value) => print(value));
    extDir?.then((value) => print(value));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hive and Path Provider"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            FutureBuilder<Directory?>(
                future: _dirT,
                builder: _buildDirectory
            ),
            FutureBuilder<Directory?>(
                future: _workingDir,
                builder: _buildDirectory
            ),
            FutureBuilder(
                future: futureBox ,
                builder: _buildHive
            ),

            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                var person = Person(name: "titi", age: 12,);
                box.add(person);
              },
            ),
            ElevatedButton(
              child: Text("Get"),
              onPressed: () {
                Person? person = box.get(1);
                print(person?.name);
              },
            ),
            ElevatedButton(
              child: Text("Clear"),
              onPressed: () async {
                Hive.deleteBoxFromDisk(boxName);
                var boxExist  = await Hive.boxExists(boxName);
                if (!boxExist) {
                  print("$boxName was successfully deleted");
                } else{
                  print("$boxName still exist");
                }
              },
            )
          ],
        ),
      );
  }

  Widget _buildHive(BuildContext context, AsyncSnapshot snapshot) {
    late Widget widget;
    switch(snapshot.connectionState){
      case ConnectionState.none:
        widget = Center(child: Text("Future started"));
        break;
      case ConnectionState.active:
      case ConnectionState.waiting:
        widget = Center(child: Text("Waiting"));
        break;
      default:
        if(snapshot.hasError)
          widget = Center(child: Text("No Hive"));
        else
          widget = Column(
            children: [

              for(var i in snapshot.data!.values) Text(i.toString()),
              Text(box.path!),
              Text("Total items ${box.length.toString()}"),
              Text("Box name ${box.name}"),
              Text("Box keys ${box.keys}"),

            ],
          );
    }

    return Center(
      child: widget,
    );
  }

  Widget _buildDirectory (BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    late Widget widget;
    if(snapshot.connectionState == ConnectionState.done) {

      if(snapshot.hasData) {
        widget = Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snapshot.data!.path),
            )
          ],
        );
      } else if(snapshot.hasError) {
        widget =  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Error"),
        );
      } else{
        widget = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Data"),
        );
      }

    } else{

      widget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Loading"),
      );
    }

    return Center(
      child: widget,
    );
  }
}
