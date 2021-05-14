import 'package:dartz/dartz.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/twitter/data/model/timeline_model.dart';
import 'package:tests/features/twitter/data/model/twitter_user_model.dart';

abstract class TweetRepository {
  Future<Either<Failure,TimeLineModel>> tweets(String user);
  Future<Either<Failure,TwitterUserModel>> getUser(String user);
}

