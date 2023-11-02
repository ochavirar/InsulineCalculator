// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'az_food_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AZFoodListItemAdapter extends TypeAdapter<AZFoodListItem> {
  @override
  final int typeId = 1;

  @override
  AZFoodListItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AZFoodListItem(
      tag: fields[0] as String,
      title: fields[1] as String,
      unit: fields[2] as String,
      baseServingSize: fields[3] as int,
      basecarbs: fields[4] as int,
      description: fields[5] as String,
      imageUrl: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AZFoodListItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.tag)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.baseServingSize)
      ..writeByte(4)
      ..write(obj.basecarbs)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AZFoodListItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
