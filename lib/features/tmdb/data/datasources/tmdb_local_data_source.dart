import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:tests/features/tmdb/data/model/people.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
abstract class TmdbLocalDataSource {

  Future<Artist> getLastCacheArtist();
  Future<void> cacheArtist(People artistCache);
}

class TmdbLocalDataSourceImpl extends TmdbLocalDataSource {


  @override
  Future<Artist> getLastCacheArtist() async {
    final Box tmdbBox =  await Hive.openBox("tmdb");
    final artistKey =  tmdbBox.get("artists");
    final artists = Future.value(Artist.fromJson(json.decode(artistKey)));
    print("artist ${artists}");
    return artists;
  }

  @override
  Future<void> cacheArtist(People artistCache) async {
   final Box tmdbBox =  await Hive.openBox("tmdb");
   tmdbBox.put("artists", json.encode(artistCache.toJson()));
   print("artis cached");
  }



}