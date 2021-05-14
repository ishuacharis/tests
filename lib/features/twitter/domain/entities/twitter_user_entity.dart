import 'package:equatable/equatable.dart';

class TwitterUserEntity extends Equatable {
  Data? data;
  Includes? includes;

  TwitterUserEntity({
      this.data, 
      this.includes});

  TwitterUserEntity.fromJson(dynamic json) {
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    includes = json["includes"] != null ? Includes.fromJson(json["includes"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.toJson();
    }
    if (includes != null) {
      map["includes"] = includes?.toJson();
    }
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class Includes {
  List<Tweets>? tweets;

  Includes({
      this.tweets});

  Includes.fromJson(dynamic json) {
    if (json["tweets"] != null) {
      tweets = [];
      json["tweets"].forEach((v) {
        tweets?.add(Tweets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (tweets != null) {
      map["tweets"] = tweets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Tweets {
  String? text;
  String? createdAt;
  String? id;

  Tweets({
      this.text, 
      this.createdAt, 
      this.id});

  Tweets.fromJson(dynamic json) {
    text = json["text"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["text"] = text;
    map["created_at"] = createdAt;
    map["id"] = id;
    return map;
  }

}

class Data {
  String? username;
  String? createdAt;
  String? pinnedTweetId;
  String? id;
  String? name;

  Data({
      this.username, 
      this.createdAt, 
      this.pinnedTweetId, 
      this.id, 
      this.name});

  Data.fromJson(dynamic json) {
    username = json["username"];
    createdAt = json["created_at"];
    pinnedTweetId = json["pinned_tweet_id"];
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = username;
    map["created_at"] = createdAt;
    map["pinned_tweet_id"] = pinnedTweetId;
    map["id"] = id;
    map["name"] = name;
    return map;
  }

}