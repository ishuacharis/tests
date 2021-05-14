import 'package:dartz/dartz.dart';
import 'package:tests/core/domain/usecase.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/twitter/domain/entities/timeline_entity.dart';
import 'package:tests/features/twitter/domain/repository/tweet_repository_impl.dart';

class TweetsUsecase implements UseCase<TimeLineEntity,TimelineParams> {

  final TweetRepository tweetRepository;

  TweetsUsecase({required this.tweetRepository });

  @override
  Future<Either<Failure, TimeLineEntity>> call(TimelineParams params) async {

    return await tweetRepository.tweets(params.username);
  }

}