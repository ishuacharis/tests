
import 'package:tests/features/twitter/domain/entities/twitter_user_entity.dart';

class TwitterUserModel extends TwitterUserEntity  {

  final data;
   TwitterUserModel({ required this.data });

   factory TwitterUserModel.fromJson( Map<String, dynamic> json) {
     return TwitterUserModel(data: json["data"]);
   }
}