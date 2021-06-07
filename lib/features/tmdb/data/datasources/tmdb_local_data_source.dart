import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:tests/features/tmdb/data/model/movie_model.dart';
import 'package:tests/features/tmdb/data/model/people.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:tests/features/tmdb/domain/entity/movie_entity.dart';
abstract class TmdbLocalDataSource {

  Future<Artist> getLastCacheArtist();
  Future<void> cacheArtist(People artistCache);
  Future<MovieModel> getLastCacheMovie(int id);
  Future<void> cacheMovie(int key, MovieEntity movieCache);

}

class TmdbLocalDataSourceImpl extends TmdbLocalDataSource {


  @override
  Future<Artist> getLastCacheArtist() async {
    final Box tmdbBox =  await Hive.openBox("tmdb");
    final artistKey =  tmdbBox.get("artists");
    final artists = Future.value(Artist.fromJson(json.decode(artistKey)));
    return artists;
  }

  @override
  Future<void> cacheArtist(People artistCache) async {
   final Box tmdbBox =  await Hive.openBox("tmdb");
   tmdbBox.put("artists", json.encode(artistCache.toJson()));
   print("artis cached");
  }

  @override
  Future<MovieModel> getLastCacheMovie(int id) async {
    final Box tmdbBox  = await Hive.openBox("tmdb");
    final movieKey =  tmdbBox.get(id);
    final movie = Future.value(MovieModel.fromJson(json.decode(movieKey)));

    return movie;
  }

  @override
  Future<void> cacheMovie(int key, MovieEntity movieCache) async {
    final Box tmdbBox = await Hive.openBox("tmdb");
    tmdbBox.put(key, json.encode(movieCache.toJson()));
    print("movie cached");
  }



}