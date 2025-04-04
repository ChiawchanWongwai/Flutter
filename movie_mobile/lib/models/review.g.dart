// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewAdapter extends TypeAdapter<Review> {
  @override
  final int typeId = 0;

  @override
  Review read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Review(
      movieTitle: fields[0] as String,
      reviewerName: fields[1] as String,
      details: fields[2] as String,
      performance: fields[3] as int,
      proceeding: fields[4] as int,
      script: fields[5] as int,
      rating: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Review obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.movieTitle)
      ..writeByte(1)
      ..write(obj.reviewerName)
      ..writeByte(2)
      ..write(obj.details)
      ..writeByte(3)
      ..write(obj.performance)
      ..writeByte(4)
      ..write(obj.proceeding)
      ..writeByte(5)
      ..write(obj.script)
      ..writeByte(6)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
