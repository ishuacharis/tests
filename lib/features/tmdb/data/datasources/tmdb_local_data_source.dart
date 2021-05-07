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
    final artist =  await Hive.openBox('artists');

    final artists = Future.value(Artist.fromJson(artist));
    return artists;
  }

  @override
  Future<void> cacheArtist(People artistCache) async {
    var artists = await Hive.openBox('artists');
    //return box.('cache_artist', artistCache);
  }



}