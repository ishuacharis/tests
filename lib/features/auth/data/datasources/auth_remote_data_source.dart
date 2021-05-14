import 'dart:convert';
import 'dart:io';

import 'package:tests/core/exceptions/exception.dart';
import 'package:tests/features/auth/data/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:tests/features/auth/domain/entities/UserEntity.dart';

abstract class AuthRemoteDatasource {

  Future<UserModel> login(UserEntity userEntity);
  Future<UserModel> register(UserEntity userEntity);
}


class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final http.Client client;

  AuthRemoteDatasourceImpl({required this.client});

  Future<UserModel> login(UserEntity userEntity) async{
    final user =  _auth(userEntity);
    
    
    return UserModel.fromJson(user);

  }

  Future<UserModel> register(UserEntity userEntity) async{
    final user =  _auth(userEntity);


    return UserModel.fromJson(user);

  }


  dynamic _auth(UserEntity userEntity) async {
    try{
      String endPoint = "http://node/api";
      var parseUri = Uri.parse(endPoint);

      http.Response response =  await client.post(parseUri,body: userEntity.toJson());

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