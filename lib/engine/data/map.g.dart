// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapConfiguration _$MapConfigurationFromJson(Map<String, dynamic> json) {
  return MapConfiguration()
    ..configuration =
        (json['configuration'] as List)?.map((e) => e as int)?.toList()
    ..width = json['width'] as int;
}

Map<String, dynamic> _$MapConfigurationToJson(MapConfiguration instance) =>
    <String, dynamic>{
      'configuration': instance.configuration,
      'width': instance.width,
    };

Tile _$TileFromJson(Map<String, dynamic> json) {
  return Tile(
    _$enumDecodeNullable(_$TileTypeEnumMap, json['type']),
    color: json['color'] as int,
    idPrefix: json['idPrefix'] as String,
    name: json['name'] as String,
    price: json['price'] as int,
    housePrice: json['housePrice'] as int,
    rent: (json['rent'] as List)?.map((e) => e as int)?.toList(),
    hyp: json['hyp'] as int,
    mortaged: json['mortaged'] as bool,
    idIndex: json['idIndex'] as int,
  )..level = json['level'] as int;
}

Map<String, dynamic> _$TileToJson(Tile instance) => <String, dynamic>{
      'type': _$TileTypeEnumMap[instance.type],
      'color': instance.color,
      'idPrefix': instance.idPrefix,
      'name': instance.name,
      'price': instance.price,
      'hyp': instance.hyp,
      'housePrice': instance.housePrice,
      'rent': instance.rent,
      'level': instance.level,
      'idIndex': instance.idIndex,
      'mortaged': instance.mortaged,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$TileTypeEnumMap = {
  TileType.land: 'land',
  TileType.company: 'company',
  TileType.trainstation: 'trainstation',
  TileType.start: 'start',
  TileType.chest: 'chest',
  TileType.tax: 'tax',
  TileType.chance: 'chance',
  TileType.jail: 'jail',
  TileType.parking: 'parking',
  TileType.police: 'police',
};
