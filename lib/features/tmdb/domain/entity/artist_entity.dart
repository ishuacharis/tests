import 'package:hive/hive.dart';
import 'package:tests/features/tmdb/data/model/people.dart';
part 'artist_entity.g.dart';

@HiveType(typeId: 2)
class Artist extends People {
  @HiveField(0)
  final List results;
  Artist({
    required this.results,
  }) : super(results: results,);

  factory Artist.fromJson(dynamic json) {

    return Artist(results: json["results"],);
  }
  Map<String,dynamic> toJson() {
    return {
      "results": results
    };
  }
  @override
  String toString() {
    // TODO: implement toString
    return "$results";
  }

}