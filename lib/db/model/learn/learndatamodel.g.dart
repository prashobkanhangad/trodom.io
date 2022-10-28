// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learndatamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class learnmodelAdapter extends TypeAdapter<learnmodel> {
  @override
  final int typeId = 4;

  @override
  learnmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return learnmodel(
      learntitle: fields[0] as String,
      learncontent: fields[1] as String,
      learnimage: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, learnmodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.learntitle)
      ..writeByte(1)
      ..write(obj.learncontent)
      ..writeByte(2)
      ..write(obj.learnimage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is learnmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
