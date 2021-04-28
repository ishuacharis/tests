import 'package:tests/features/tmdb/data/model/people.dart';

class Artist extends People {

  final int? page;
  late List results;
  int? totalPages;
  int? totalResults;
  Artist({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults
  }) : super(page: page, results: results,totalResults: totalResults, totalPages: totalPages);

  factory Artist.fromJson(dynamic json) {

    return Artist(page: json["page"], results: json["results"], totalPages: json["totalPages"], totalResults: json["totalResults"]);
  }

}