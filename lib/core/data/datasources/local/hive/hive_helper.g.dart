// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_helper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCourseAdapter extends TypeAdapter<HiveCourse> {
  @override
  final int typeId = 1;

  @override
  HiveCourse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCourse(
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCourse obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
