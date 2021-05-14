import 'package:equatable/equatable.dart';

class TimeLineEntity extends Equatable{
  List<Data>? data;
  Includes? includes;
  List<Errors>? errors;
  Meta? meta;

  TimeLineEntity({
      this.data, 
      this.includes, 
      this.errors, 
      this.meta});

  TimeLineEntity.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    includes = json["includes"] != null ? Includes.fromJson(json["includes"]) : null;
    if (json["errors"] != null) {
      errors = [];
      json["errors"].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
    meta = json["meta"] != null ? Meta.fromJson(json["meta"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.map((v) => v.toJson()).toList();
    }
    if (includes != null) {
      map["includes"] = includes?.toJson();
    }
    if (errors != null) {
      map["errors"] = errors?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map["meta"] = meta?.toJson();
    }
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data,includes,errors,meta];

}

class Meta {
  String? oldestId;
  String? newestId;
  int? resultCount;
  String? nextToken;

  Meta({
      this.oldestId, 
      this.newestId, 
      this.resultCount, 
      this.nextToken});

  Meta.fromJson(dynamic json) {
    oldestId = json["oldest_id"];
    newestId = json["newest_id"];
    resultCount = json["result_count"];
    nextToken = json["next_token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["oldest_id"] = oldestId;
    map["newest_id"] = newestId;
    map["result_count"] = resultCount;
    map["next_token"] = nextToken;
    return map;
  }

}

class Errors {
  String? resourceId;
  String? parameter;
  String? resourceType;
  String? section;
  String? title;
  String? value;
  String? detail;
  String? type;

  Errors({
      this.resourceId, 
      this.parameter, 
      this.resourceType, 
      this.section, 
      this.title, 
      this.value, 
      this.detail, 
      this.type});

  Errors.fromJson(dynamic json) {
    resourceId = json["resource_id"];
    parameter = json["parameter"];
    resourceType = json["resource_type"];
    section = json["section"];
    title = json["title"];
    value = json["value"];
    detail = json["detail"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["resource_id"] = resourceId;
    map["parameter"] = parameter;
    map["resource_type"] = resourceType;
    map["section"] = section;
    map["title"] = title;
    map["value"] = value;
    map["detail"] = detail;
    map["type"] = type;
    return map;
  }

}

class Includes {
  List<Users>? users;
  List<Tweets>? tweets;

  Includes({
      this.users, 
      this.tweets});

  Includes.fromJson(dynamic json) {
    if (json["users"] != null) {
      users = [];
      json["users"].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    if (json["tweets"] != null) {
      tweets = [];
      json["tweets"].forEach((v) {
        tweets?.add(Tweets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (users != null) {
      map["users"] = users?.map((v) => v.toJson()).toList();
    }
    if (tweets != null) {
      map["tweets"] = tweets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Tweets {
  TweetPublicMetrics? publicMetrics;
  String? source;
  Entities? entities;
  String? id;
  List<ReferencedTweets>? referencedTweets;
  String? conversationId;
  String? text;
  String? authorId;
  String? createdAt;
  String? replySettings;
  String? lang;
  List<ContextAnnotations>? contextAnnotations;
  bool? possiblySensitive;

  Tweets({
      this.publicMetrics, 
      this.source, 
      this.entities, 
      this.id, 
      this.referencedTweets, 
      this.conversationId, 
      this.text, 
      this.authorId, 
      this.createdAt, 
      this.replySettings, 
      this.lang, 
      this.contextAnnotations, 
      this.possiblySensitive});

  Tweets.fromJson(dynamic json) {
    publicMetrics = json["public_metrics"] != null ? TweetPublicMetrics.fromJson(json["publicMetrics"]) : null;
    source = json["source"];
    entities = json["entities"] != null ? Entities.fromJson(json["entities"]) : null;
    id = json["id"];
    if (json["referenced_tweets"] != null) {
      referencedTweets = [];
      json["referenced_tweets"].forEach((v) {
        referencedTweets?.add(ReferencedTweets.fromJson(v));
      });
    }
    conversationId = json["conversation_id"];
    text = json["text"];
    authorId = json["author_id"];
    createdAt = json["created_at"];
    replySettings = json["reply_settings"];
    lang = json["lang"];
    if (json["context_annotations"] != null) {
      contextAnnotations = [];
      json["context_annotations"].forEach((v) {
        contextAnnotations?.add(ContextAnnotations.fromJson(v));
      });
    }
    possiblySensitive = json["possibly_sensitive"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (publicMetrics != null) {
      map["public_metrics"] = publicMetrics?.toJson();
    }
    map["source"] = source;
    if (entities != null) {
      map["entities"] = entities?.toJson();
    }
    map["id"] = id;
    if (referencedTweets != null) {
      map["referenced_tweets"] = referencedTweets?.map((v) => v.toJson()).toList();
    }
    map["conversation_id"] = conversationId;
    map["text"] = text;
    map["author_id"] = authorId;
    map["created_at"] = createdAt;
    map["reply_settings"] = replySettings;
    map["lang"] = lang;
    if (contextAnnotations != null) {
      map["context_annotations"] = contextAnnotations?.map((v) => v.toJson()).toList();
    }
    map["possibly_sensitive"] = possiblySensitive;
    return map;
  }

}

class Entity {
  String? id;
  String? name;

  Entity({
      this.id, 
      this.name});

  Entity.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }

}

class Domain {
  String? id;
  String? name;
  String? description;

  Domain({
      this.id, 
      this.name, 
      this.description});

  Domain.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    return map;
  }

}

class ReferencedTweets {
  String? type;
  String? id;

  ReferencedTweets({
      this.type, 
      this.id});

  ReferencedTweets.fromJson(dynamic json) {
    type = json["type"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    map["id"] = id;
    return map;
  }

}

class Entities {
  List<Annotations>? annotations;
  List<Urls>? urls;

  Entities({
      this.annotations, 
      this.urls});

  Entities.fromJson(dynamic json) {
    if (json["annotations"] != null) {
      annotations = [];
      json["annotations"].forEach((v) {
        annotations?.add(Annotations.fromJson(v));
      });
    }
    if (json["urls"] != null) {
      urls = [];
      json["urls"].forEach((v) {
        urls?.add(Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (annotations != null) {
      map["annotations"] = annotations?.map((v) => v.toJson()).toList();
    }
    if (urls != null) {
      map["urls"] = urls?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Urls {
  int? start;
  int? end;
  String? url;
  String? expandedUrl;
  String? displayUrl;

  Urls({
      this.start, 
      this.end, 
      this.url, 
      this.expandedUrl, 
      this.displayUrl});

  Urls.fromJson(dynamic json) {
    start = json["start"];
    end = json["end"];
    url = json["url"];
    expandedUrl = json["expanded_url"];
    displayUrl = json["display_url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["start"] = start;
    map["end"] = end;
    map["url"] = url;
    map["expanded_url"] = expandedUrl;
    map["display_url"] = displayUrl;
    return map;
  }

}

class Annotations {
  int? start;
  int? end;
  double? probability;
  String? type;
  String? normalizedText;

  Annotations({
      this.start, 
      this.end, 
      this.probability, 
      this.type, 
      this.normalizedText});

  Annotations.fromJson(dynamic json) {
    start = json["start"];
    end = json["end"];
    probability = json["probability"];
    type = json["type"];
    normalizedText = json["normalized_text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["start"] = start;
    map["end"] = end;
    map["probability"] = probability;
    map["type"] = type;
    map["normalized_text"] = normalizedText;
    return map;
  }

}

class TweetPublicMetrics {
  int? retweetCount;
  int? replyCount;
  int? likeCount;
  int? quoteCount;

  TweetPublicMetrics({
      this.retweetCount, 
      this.replyCount, 
      this.likeCount, 
      this.quoteCount});

  TweetPublicMetrics.fromJson(dynamic json) {
    retweetCount = json["retweet_count"];
    replyCount = json["reply_count"];
    likeCount = json["like_count"];
    quoteCount = json["quote_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["retweet_count"] = retweetCount;
    map["reply_count"] = replyCount;
    map["like_count"] = likeCount;
    map["quote_count"] = quoteCount;
    return map;
  }

}

class Users {
  String? profileImageUrl;
  String? id;
  String? url;
  TweetPublicMetrics? publicMetrics;
  String? name;
  Entities? entities;
  String? username;
  String? location;
  bool? verified;
  bool? protected;
  String? description;
  String? pinnedTweetId;
  String? createdAt;

  Users({
      this.profileImageUrl, 
      this.id, 
      this.url, 
      this.publicMetrics, 
      this.name, 
      this.entities, 
      this.username, 
      this.location, 
      this.verified, 
      this.protected, 
      this.description, 
      this.pinnedTweetId, 
      this.createdAt});

  Users.fromJson(dynamic json) {
    profileImageUrl = json["profile_image_url"];
    id = json["id"];
    url = json["url"];
    publicMetrics = json["public_metrics"] != null ? TweetPublicMetrics.fromJson(json["publicMetrics"]) : null;
    name = json["name"];
    entities = json["entities"] != null ? Entities.fromJson(json["entities"]) : null;
    username = json["username"];
    location = json["location"];
    verified = json["verified"];
    protected = json["protected"];
    description = json["description"];
    pinnedTweetId = json["pinned_tweet_id"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["profile_image_url"] = profileImageUrl;
    map["id"] = id;
    map["url"] = url;
    if (publicMetrics != null) {
      map["public_metrics"] = publicMetrics?.toJson();
    }
    map["name"] = name;
    if (entities != null) {
      map["entities"] = entities?.toJson();
    }
    map["username"] = username;
    map["location"] = location;
    map["verified"] = verified;
    map["protected"] = protected;
    map["description"] = description;
    map["pinned_tweet_id"] = pinnedTweetId;
    map["created_at"] = createdAt;
    return map;
  }

}

class UrlDescriptionEntities {
  Url? url;
  Description? description;

  UrlDescriptionEntities({
      this.url, 
      this.description});

  UrlDescriptionEntities.fromJson(dynamic json) {
    url = json["url"] != null ? Url.fromJson(json["url"]) : null;
    description = json["description"] != null ? Description.fromJson(json["description"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (url != null) {
      map["url"] = url?.toJson();
    }
    if (description != null) {
      map["description"] = description?.toJson();
    }
    return map;
  }

}

class Description {
  List<Hashtags>? hashtags;

  Description({
      this.hashtags});

  Description.fromJson(dynamic json) {
    if (json["hashtags"] != null) {
      hashtags = [];
      json["hashtags"].forEach((v) {
        hashtags?.add(Hashtags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (hashtags != null) {
      map["hashtags"] = hashtags?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Hashtags {
  int? start;
  int? end;
  String? tag;

  Hashtags({
      this.start, 
      this.end, 
      this.tag});

  Hashtags.fromJson(dynamic json) {
    start = json["start"];
    end = json["end"];
    tag = json["tag"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["start"] = start;
    map["end"] = end;
    map["tag"] = tag;
    return map;
  }

}

class Url {
  List<Urls>? urls;

  Url({
      this.urls});

  Url.fromJson(dynamic json) {
    if (json["urls"] != null) {
      urls = [];
      json["urls"].forEach((v) {
        urls?.add(Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (urls != null) {
      map["urls"] = urls?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class PublicMetrics {
  int? followersCount;
  int? followingCount;
  int? tweetCount;
  int? listedCount;

  PublicMetrics({
      this.followersCount, 
      this.followingCount, 
      this.tweetCount, 
      this.listedCount});

  PublicMetrics.fromJson(dynamic json) {
    followersCount = json["followers_count"];
    followingCount = json["following_count"];
    tweetCount = json["tweet_count"];
    listedCount = json["listed_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["followers_count"] = followersCount;
    map["following_count"] = followingCount;
    map["tweet_count"] = tweetCount;
    map["listed_count"] = listedCount;
    return map;
  }

}

class Data {
  TweetPublicMetrics? publicMetrics;
  String? source;
  UrlEntities? entities;
  String? id;
  List<ReferencedTweets>? referencedTweets;
  String? conversationId;
  String? text;
  String? authorId;
  String? createdAt;
  String? replySettings;
  String? lang;
  List<ContextAnnotations>? contextAnnotations;
  bool? possiblySensitive;

  Data({
      this.publicMetrics, 
      this.source, 
      this.entities, 
      this.id, 
      this.referencedTweets, 
      this.conversationId, 
      this.text, 
      this.authorId, 
      this.createdAt, 
      this.replySettings, 
      this.lang, 
      this.contextAnnotations, 
      this.possiblySensitive});

  Data.fromJson(dynamic json) {
    publicMetrics = json["public_metrics"] != null ? TweetPublicMetrics.fromJson(json["publicMetrics"]) : null;
    source = json["source"];
    entities = json["entities"] != null ? UrlEntities.fromJson(json["entities"]) : null;
    id = json["id"];
    if (json["referenced_tweets"] != null) {
      referencedTweets = [];
      json["referenced_tweets"].forEach((v) {
        referencedTweets?.add(ReferencedTweets.fromJson(v));
      });
    }
    conversationId = json["conversation_id"];
    text = json["text"];
    authorId = json["author_id"];
    createdAt = json["created_at"];
    replySettings = json["reply_settings"];
    lang = json["lang"];
    if (json["context_annotations"] != null) {
      contextAnnotations = [];
      json["context_annotations"].forEach((v) {
        contextAnnotations?.add(ContextAnnotations.fromJson(v));
      });
    }
    possiblySensitive = json["possibly_sensitive"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (publicMetrics != null) {
      map["public_metrics"] = publicMetrics?.toJson();
    }
    map["source"] = source;
    if (entities != null) {
      map["entities"] = entities?.toJson();
    }
    map["id"] = id;
    if (referencedTweets != null) {
      map["referenced_tweets"] = referencedTweets?.map((v) => v.toJson()).toList();
    }
    map["conversation_id"] = conversationId;
    map["text"] = text;
    map["author_id"] = authorId;
    map["created_at"] = createdAt;
    map["reply_settings"] = replySettings;
    map["lang"] = lang;
    if (contextAnnotations != null) {
      map["context_annotations"] = contextAnnotations?.map((v) => v.toJson()).toList();
    }
    map["possibly_sensitive"] = possiblySensitive;
    return map;
  }

}

class ContextAnnotations {
  Domain? domain;
  Entity? entity;

  ContextAnnotations({
      this.domain, 
      this.entity});

  ContextAnnotations.fromJson(dynamic json) {
    domain = json["domain"] != null ? Domain.fromJson(json["domain"]) : null;
    entity = json["entity"] != null ? Entity.fromJson(json["entity"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (domain != null) {
      map["domain"] = domain?.toJson();
    }
    if (entity != null) {
      map["entity"] = entity?.toJson();
    }
    return map;
  }

}


class UrlEntities {
  List<Urls>? urls;

  UrlEntities({
      this.urls});

  UrlEntities.fromJson(dynamic json) {
    if (json["urls"] != null) {
      urls = [];
      json["urls"].forEach((v) {
        urls?.add(Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (urls != null) {
      map["urls"] = urls?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


