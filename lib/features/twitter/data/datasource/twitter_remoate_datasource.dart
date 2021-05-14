import 'dart:convert';
import 'dart:io';

import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:tests/core/exceptions/exception.dart';
import 'package:tests/features/twitter/data/model/timeline_model.dart';
import 'package:tests/features/twitter/data/model/twitter_user_model.dart';


var TWITTER_CONSUMER_KEY = FlutterConfig.get('TWITTER_CONSUMER_KEY');
var TWITTER_CONSUMER_SECRET_KEY = FlutterConfig.get('TWITTER_CONSUMER_SECRET_KEY');
var TWITTER_ACCESS_TOKEN = FlutterConfig.get('TWITTER_ACCESS_TOKEN');
var TWITTER_ACCESS_TOKEN_SECRET = FlutterConfig.get('TWITTER_ACCESS_TOKEN_SECRET');
var TWITTER_BEARER_TOKEN = FlutterConfig.get('TWITTER_BEARER_TOKEN');
String basePoint =  "https://api.twitter.com/2/users/";

abstract class TwitterDatasource {
  Future<TimeLineModel> tweets(String user);
  Future<TwitterUserModel> getUser(String username);
}


class TwitterRemoteDatasourceImpl implements TwitterDatasource {

  final http.Client client;

  TwitterRemoteDatasourceImpl({ required this.client });

  @override
  Future<TimeLineModel> tweets(String user) async {
    final timeline = await _getUserTimeline(user);
    return TimeLineModel.fromJson(timeline);
  }

  @override
  Future<TwitterUserModel> getUser(String username) async {
    final user = await _getUser(username);
    return await TwitterUserModel.fromJson(user);
  }

  dynamic _getUserTimeline(String user) async {
    try{
      var endPoint =  "$basePoint$user/tweets";
      var parseUri = Uri.parse(endPoint);
      var headers = {
        "Authorization": "Bearer $TWITTER_BEARER_TOKEN"
      };

      http.Response response =  await client.get(parseUri, headers: headers);

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

  dynamic _getUser(String user) async {
    try{
      var endPoint =  "https://api.twitter.com/2/users/by/username/$user";
      var parseUri = Uri.parse(endPoint);
      var headers = {
        "Authorization": "Bearer $TWITTER_BEARER_TOKEN"
      };

      http.Response response =  await client.get(parseUri, headers: headers);

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


}