class People {
  int? page;
  late List<Results> results;
  int? totalPages;
  int? totalResults;

  People({
      this.page,
      required this.results,
      this.totalPages,
      this.totalResults});

  factory People.fromJson(dynamic json) {

    return People(page: json["page"], results: json["results"], totalPages: json["totalPages"], totalResults: json["totalResults"]);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = page;
    if (results != null) {
      map["results"] = results.map((v) => v.toJson()).toList();
    }
    map["total_pages"] = totalPages;
    map["total_results"] = totalResults;
    return map;
  }

}

class Results {
  bool? adult;
  int? gender;
  int? id;
  List<Known_for?>? knownFor;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  Results({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownFor, 
      this.knownForDepartment, 
      this.name, 
      this.popularity, 
      this.profilePath});

  Results.fromJson(dynamic json) {
    adult = json["adult"];
    gender = json["gender"];
    id = json["id"];
    if (json["known_for"] != null) {
      knownFor = [];
      json["known_for"].forEach((v) {
        knownFor?.add(Known_for.fromJson(v));
      });
    }
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    popularity = json["popularity"];
    profilePath = json["profile_path"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = adult;
    map["gender"] = gender;
    map["id"] = id;
    if (knownFor != null) {
      map["known_for"] = knownFor?.map((v) => v?.toJson()).toList();
    }
    map["known_for_department"] = knownForDepartment;
    map["name"] = name;
    map["popularity"] = popularity;
    map["profile_path"] = profilePath;
    return map;
  }

}

class Known_for {
  String? backdropPath;
  String? firstAirDate;
  List<int?>? genreIds;
  int? id;
  String? mediaType;
  String? name;
  List<String?>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  Known_for({
      this.backdropPath, 
      this.firstAirDate, 
      this.genreIds, 
      this.id, 
      this.mediaType, 
      this.name, 
      this.originCountry, 
      this.originalLanguage, 
      this.originalName, 
      this.overview, 
      this.posterPath, 
      this.voteAverage, 
      this.voteCount});

  Known_for.fromJson(dynamic json) {
    backdropPath = json["backdrop_path"];
    firstAirDate = json["first_air_date"];
    genreIds = json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [];
    id = json["id"];
    mediaType = json["media_type"];
    name = json["name"];
    originCountry = json["origin_country"] != null ? json["origin_country"].cast<String>() : [];
    originalLanguage = json["original_language"];
    originalName = json["original_name"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["backdrop_path"] = backdropPath;
    map["first_air_date"] = firstAirDate;
    map["genre_ids"] = genreIds;
    map["id"] = id;
    map["media_type"] = mediaType;
    map["name"] = name;
    map["origin_country"] = originCountry;
    map["original_language"] = originalLanguage;
    map["original_name"] = originalName;
    map["overview"] = overview;
    map["poster_path"] = posterPath;
    map["vote_average"] = voteAverage;
    map["vote_count"] = voteCount;
    return map;
  }

}