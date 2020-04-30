// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankData _$BankDataFromJson(Map<String, dynamic> json) {
  return BankData()
    ..expendature = json['expendature'] as int
    ..expandatureList =
        (json['expandatureList'] as List)?.map((e) => e as int)?.toList()
    ..bullPoints = json['bullPoints'] as int
    ..volatility = json['volatility'] as int
    ..worldStock = json['worldStock'] == null
        ? null
        : Stock.fromJson(json['worldStock'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BankDataToJson(BankData instance) => <String, dynamic>{
      'expendature': instance.expendature,
      'expandatureList': instance.expandatureList,
      'bullPoints': instance.bullPoints,
      'volatility': instance.volatility,
      'worldStock': instance.worldStock?.toJson(),
    };
