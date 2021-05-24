import 'package:hive/hive.dart';
import 'package:tests/features/tmdb/domain/entity/movie_entity.dart';
part 'movie_model.g.dart';

@HiveType(typeId: 3)
class MovieModel extends MovieEntity{
  @HiveField(0)
  String? backdropPath;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? imdbId;
  @HiveField(3)
  String? originalLanguage;
  @HiveField(4)
  String? originalTitle;
  @HiveField(5)
  String? overview;
  @HiveField(6)
  double? popularity;
  @HiveField(7)
  String? posterPath;
  @HiveField(8)
  String? releaseDate;
  @HiveField(9)
  int? revenue;
  @HiveField(10)
  int? runtime;
  @HiveField(11)
  String? status;
  @HiveField(12)
  String? tagline;
  @HiveField(13)
  String? title;
  @HiveField(14)
  double? voteAverage;
  @HiveField(15)
  int? voteCount;

  MovieModel({
    this.backdropPath,
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
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount});

  MovieModel.fromJson(dynamic json) {
    backdropPath = json["backdrop_path"];
    budget = json["budget"];
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
    tagline = json["tagline"];
    title = json["title"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }
}