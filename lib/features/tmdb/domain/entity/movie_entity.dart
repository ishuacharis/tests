import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
  bool? adult;
  String? backdropPath;
  dynamic? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;

  String? releaseDate;
  int? revenue;
  int? runtime;
  List<Spoken_languages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieEntity({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath,
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount});

  MovieEntity.fromJson(dynamic json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    belongsToCollection = json["belongs_to_collection"];
    budget = json["budget"];
    if (json["genres"] != null) {
      genres = [];
      json["genres"].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json["homepage"];
    id = json["id"];
    imdbId = json["imdb_id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];

    releaseDate = json["release_date"];
    revenue = json["revenue"];
    runtime = json["runtime"];
    if (json["spoken_languages"] != null) {
      spokenLanguages = [];
      json["spoken_languages"].forEach((v) {
        spokenLanguages?.add(Spoken_languages.fromJson(v));
      });
    }
    status = json["status"];
    tagline = json["tagline"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = adult;
    map["backdrop_path"] = backdropPath;
    map["belongs_to_collection"] = belongsToCollection;
    map["budget"] = budget;
    if (genres != null) {
      map["genres"] = genres?.map((v) => v.toJson()).toList();
    }
    map["homepage"] = homepage;
    map["id"] = id;
    map["imdb_id"] = imdbId;
    map["original_language"] = originalLanguage;
    map["original_title"] = originalTitle;
    map["overview"] = overview;
    map["popularity"] = popularity;
    map["poster_path"] = posterPath;
    map["release_date"] = releaseDate;
    map["revenue"] = revenue;
    map["runtime"] = runtime;
    if (spokenLanguages != null) {
      map["spoken_languages"] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map["status"] = status;
    map["tagline"] = tagline;
    map["title"] = title;
    map["video"] = video;
    map["vote_average"] = voteAverage;
    map["vote_count"] = voteCount;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class Spoken_languages {
  String? iso6391;
  String? name;

  Spoken_languages({
      this.iso6391, 
      this.name});

  Spoken_languages.fromJson(dynamic json) {
    iso6391 = json["iso_639_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["iso_639_1"] = iso6391;
    map["name"] = name;
    return map;
  }

}

class Production_countries {
  String? iso31661;
  String? name;

  Production_countries({
      this.iso31661, 
      this.name});

  Production_countries.fromJson(dynamic json) {
    iso31661 = json["iso_3166_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["iso_3166_1"] = iso31661;
    map["name"] = name;
    return map;
  }

}

class Production_companies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Production_companies({
      this.id, 
      this.logoPath, 
      this.name, 
      this.originCountry});

  Production_companies.fromJson(dynamic json) {
    id = json["id"];
    logoPath = json["logo_path"];
    name = json["name"];
    originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["logo_path"] = logoPath;
    map["name"] = name;
    map["origin_country"] = originCountry;
    return map;
  }

}

class Genres {
  int? id;
  String? name;

  Genres({
      this.id, 
      this.name});

  Genres.fromJson(dynamic json) {
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