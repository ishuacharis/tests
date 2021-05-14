
import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/twitter/domain/entities/twitter_user_entity.dart';
import 'package:tests/features/twitter/domain/repository/tweet_repository_impl.dart';

class GetUserUsecase implements UseCase<TwitterUserEntity,TwitterUserParams> {
  final TweetRepository tweetRepository;
  GetUserUsecase({ required this.tweetRepository });

  @override
  Future<Either<Failure, TwitterUserEntity>> call(TwitterUserParams params) async {

    return await tweetRepository.getUser(params.username);
  }

}