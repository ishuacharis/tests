import 'package:tests/features/tmdb/domain/entity/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  List<Result>? result;

  MoviesModel({ required this.result,});

  MoviesModel.fromJson(dynamic json) {

    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }

  }

}

class Result {
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

  Result({
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

  Result.fromJson(dynamic json) {
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



}