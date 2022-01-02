// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kurs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KursAdapter extends TypeAdapter<Kurs> {
  @override
  final int typeId = 0;

  @override
  Kurs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Kurs()
      ..name = fields[0] as String
      ..time = fields[1] as int
      ..category = fields[2] as String
      ..imagePath = fields[3] as String
      ..videoPath = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, Kurs obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.videoPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KursAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
