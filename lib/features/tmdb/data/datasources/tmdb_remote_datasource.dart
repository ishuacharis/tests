import 'dart:convert';
import 'dart:io';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:tests/features/tmdb/data/datasources/tmdb_datasource.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import '../../../../core/exceptions/exception.dart';

var API_KEY = FlutterConfig.get('TMOVIES_API_KEY');
String endPoint =  "https://api.themoviedb.org/3/person/popular?api_key=$API_KEY";


class TmdbRemoteDataSourceImpl implements TmdbRemoteDataSource {

  final http.Client client;

  TmdbRemoteDataSourceImpl({ required this.client });

  @override
  Future<Artist> getAllPeople() async {
    final people =  await _getAllPeople();
    return Artist.fromJson(people);
  }


  dynamic _getAllPeople() async {
    try{
      var parseUri = Uri.parse(endPoint);

      http.Response response =  await client.get(parseUri);

      Map<String,dynamic> results = json.decode(response.body);
      if(response.statusCode != 200) {
        throw Exception("Unable to process url");
      }
     return results;

    } on SocketException {

      throw NetworkException(error: "Please check your internet settings");
    } on HttpException {

      throw ServerException(error: "Internal server error");
    } on FormatException {

      throw InvalidFormatException(error: "Please check your data");
    }
    catch(e) {

      throw Exception(e.toString());
    }


  }

  @override
  Future<Artist> getAllPeopleRiverPod() async {
    final people =  await _getAllPeople();
    return Artist.fromJson(people);
  }

}