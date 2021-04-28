import 'dart:convert';
import 'dart:io';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import '../../../../core/exceptions/exception.dart';
import '../model/people.dart';

var API_KEY = FlutterConfig.get('TMOVIES_API_KEY');
String endPoint =  "https://api.themoviedb.org/3/person/popular?api_key=$API_KEY";
abstract class TmdbRemoteDataSource {

  Future<People> getAllPeople();

}


class TmdbRemoteDataSourceImpl implements TmdbRemoteDataSource {

  final http.Client client;

  TmdbRemoteDataSourceImpl({ required this.client });

  @override
  Future<People> getAllPeople() async {
    final people =  await _getAllPeople();
    return People.fromJson(people);
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
    } catch(e) {

      throw Exception(e.toString());
    }


  }

}