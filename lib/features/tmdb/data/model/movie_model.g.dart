// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 3;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      backdropPath: fields[0] as String?,
      id: fields[1] as int?,
      imdbId: fields[2] as String?,
      originalLanguage: fields[3] as String?,
      originalTitle: fields[4] as String?,
      overview: fields[5] as String?,
      popularity: fields[6] as double?,
      posterPath: fields[7] as String?,
      releaseDate: fields[8] as String?,
      revenue: fields[9] as int?,
      runtime: fields[10] as int?,
      status: fields[11] as String?,
      tagline: fields[12] as String?,
      title: fields[13] as String?,
      voteAverage: fields[14] as double?,
      voteCount: fields[15] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imdbId)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.posterPath)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.revenue)
      ..writeByte(10)
      ..write(obj.runtime)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.tagline)
      ..writeByte(13)
      ..write(obj.title)
      ..writeByte(14)
      ..write(obj.voteAverage)
      ..writeByte(15)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
