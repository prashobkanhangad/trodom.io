// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketdatamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class marketmodelAdapter extends TypeAdapter<marketmodel> {
  @override
  final int typeId = 3;

  @override
  marketmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return marketmodel(
      markettitle: fields[0] as String,
      marketnews: fields[1] as String,
      marketimage: fields[2] as String,
      marketdate: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, marketmodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.markettitle)
      ..writeByte(1)
      ..write(obj.marketnews)
      ..writeByte(2)
      ..write(obj.marketimage)
      ..writeByte(3)
      ..write(obj.marketdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is marketmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
