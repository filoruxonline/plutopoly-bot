// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealData _$DealDataFromJson(Map<String, dynamic> json) {
  return DealData()
    ..payAmount = json['payAmount'] as int
    ..receivableProperties =
        (json['receivableProperties'] as List)?.map((e) => e as int)?.toList()
    ..receiveProperties =
        (json['receiveProperties'] as List)?.map((e) => e as int)?.toList()
    ..payableProperties =
        (json['payableProperties'] as List)?.map((e) => e as int)?.toList()
    ..payProperties =
        (json['payProperties'] as List)?.map((e) => e as int)?.toList()
    ..price = json['price'] as int
    ..valid = (json['valid'] as List)?.map((e) => e as bool)?.toList()
    ..playerChecked = json['playerChecked'] as bool
    ..dealerChecked = json['dealerChecked'] as bool
    ..dealer = json['dealer'] as int;
}

Map<String, dynamic> _$DealDataToJson(DealData instance) => <String, dynamic>{
      'payAmount': instance.payAmount,
      'receivableProperties': instance.receivableProperties,
      'receiveProperties': instance.receiveProperties,
      'payableProperties': instance.payableProperties,
      'payProperties': instance.payProperties,
      'price': instance.price,
      'valid': instance.valid,
      'playerChecked': instance.playerChecked,
      'dealerChecked': instance.dealerChecked,
      'dealer': instance.dealer,
    };
