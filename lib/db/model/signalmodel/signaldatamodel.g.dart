// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signaldatamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class signalmodelAdapter extends TypeAdapter<signalmodel> {
  @override
  final int typeId = 2;

  @override
  signalmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return signalmodel(
      signaltitle: fields[0] as String,
      signalimage: fields[1] as String,
      id: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, signalmodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.signaltitle)
      ..writeByte(1)
      ..write(obj.signalimage)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is signalmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
