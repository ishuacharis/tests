import 'package:equatable/equatable.dart';

class MoviesEntity extends Equatable{
  int? page;
  List<Results>? results;
  int? totalResults;
  int? totalPages;

  MoviesEntity({
      this.page, 
      this.results, 
      this.totalResults, 
      this.totalPages});

  MoviesEntity.fromJson(dynamic json) {
    page = json["page"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalResults = json["total_results"];
    totalPages = json["total_pages"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = page;
    if (results != null) {
      map["results"] = results?.map((v) => v.toJson()).toList();
    }
    map["total_results"] = totalResults;
    map["total_pages"] = totalPages;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [results];

}

class Results {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  double? popularity;
  int? voteCount;
  bool? video;
  double? voteAverage;

  Results({
      this.posterPath, 
      this.adult, 
      this.overview, 
      this.releaseDate, 
      this.genreIds, 
      this.id, 
      this.originalTitle, 
      this.originalLanguage, 
      this.title, 
      this.backdropPath, 
      this.popularity, 
      this.voteCount, 
      this.video, 
      this.voteAverage});

  Results.fromJson(dynamic json) {
    posterPath = json["poster_path"];
    adult = json["adult"];
    overview = json["overview"];
    releaseDate = json["release_date"];
    genreIds = json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [];
    id = json["id"];
    originalTitle = json["original_title"];
    originalLanguage = json["original_language"];
    title = json["title"];
    backdropPath = json["backdrop_path"];
    popularity = json["popularity"];
    voteCount = json["vote_count"];
    video = json["video"];
    voteAverage = json["vote_average"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["poster_path"] = posterPath;
    map["adult"] = adult;
    map["overview"] = overview;
    map["release_date"] = releaseDate;
    map["genre_ids"] = genreIds;
    map["id"] = id;
    map["original_title"] = originalTitle;
    map["original_language"] = originalLanguage;
    map["title"] = title;
    map["backdrop_path"] = backdropPath;
    map["popularity"] = popularity;
    map["vote_count"] = voteCount;
    map["video"] = video;
    map["vote_average"] = voteAverage;
    return map;
  }

}