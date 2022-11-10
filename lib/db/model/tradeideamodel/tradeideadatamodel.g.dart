// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tradeideadatamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class tradeideamodelAdapter extends TypeAdapter<tradeideamodel> {
  @override
  final int typeId = 1;

  @override
  tradeideamodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return tradeideamodel(
      stockname: fields[0] as String,
      stoploss: fields[1] as String,
      entryprice: fields[2] as String,
      targetprice: fields[3] as String,
      id: fields[4] as String,
      type: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, tradeideamodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.stockname)
      ..writeByte(1)
      ..write(obj.stoploss)
      ..writeByte(2)
      ..write(obj.entryprice)
      ..writeByte(3)
      ..write(obj.targetprice)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is tradeideamodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
