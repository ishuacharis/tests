import 'package:dartz/dartz.dart';
import 'package:tests/core/exceptions/exception.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/twitter/data/datasource/twitter_remoate_datasource.dart';
import 'package:tests/features/twitter/data/model/timeline_model.dart';
import 'package:tests/features/twitter/data/model/twitter_user_model.dart';

import 'package:tests/features/twitter/domain/repository/tweet_repository_impl.dart';

class TweetRepositoryImpl implements TweetRepository {
  final TwitterDatasource twitterDatasource;

  TweetRepositoryImpl({required this.twitterDatasource });

  @override
  Future<Either<Failure, TimeLineModel>> tweets(String user) async {
    try{
      final tweets  =  await twitterDatasource.tweets(user);

      return Right(tweets);

    }on ServerException {
      return Left(ServerFailure(failure: "Please check your internet settings"));
    } on NetworkException {
      return Left(NetWorkFailure(failure: "Internal server error"));
    } on InvalidFormatException {
      return Left(InvalidFormatFailure(failure: "Please check your data"));
    } catch(e) {
      print("error ${e}");
      return Left(UnCaughtFailure(failure: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TwitterUserModel>> getUser(String username) async{
    try{
      final user  =  await twitterDatasource.getUser(username);

      return Right(user);

    }on ServerException {
      return Left(ServerFailure(failure: "Please check your internet settings"));
    } on NetworkException {
      return Left(NetWorkFailure(failure: "Internal server error"));
    } on InvalidFormatException {
      return Left(InvalidFormatFailure(failure: "Please check your data"));
    } catch(e) {
      print("error ${e}");
      return Left(UnCaughtFailure(failure: e.toString()));
    }
  }

}