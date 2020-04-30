// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) {
  return Stock(
    id: json['id'] as String,
    value: (json['value'] as num)?.toDouble(),
    volume: json['volume'] as int,
    info: json['info'] as String,
  )..valueHistory = (json['valueHistory'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), (e as num)?.toDouble()),
    );
}

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'volume': instance.volume,
      'info': instance.info,
      'valueHistory':
          instance.valueHistory?.map((k, e) => MapEntry(k.toString(), e)),
    };
