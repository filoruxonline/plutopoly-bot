// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    money: (json['money'] as num)?.toDouble(),
    color: json['color'] as int,
    position: json['position'] as int,
    name: json['name'] as String,
    code: json['code'] as int,
  )
    ..properties = (json['properties'] as List)?.map((e) => e as int)?.toList()
    ..jailed = json['jailed'] as bool
    ..jailTries = json['jailTries'] as int
    ..goojCards = json['goojCards'] as int
    ..info = (json['info'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          int.parse(k),
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : UpdateInfo.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    )
    ..moneyHistory = (json['moneyHistory'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList()
    ..debt = (json['debt'] as num)?.toDouble()
    ..loans = (json['loans'] as List)
        ?.map((e) =>
            e == null ? null : Contract.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..stock = (json['stock'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    );
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'money': instance.money,
      'position': instance.position,
      'color': instance.color,
      'properties': instance.properties,
      'jailed': instance.jailed,
      'jailTries': instance.jailTries,
      'goojCards': instance.goojCards,
      'info': instance.info?.map((k, e) =>
          MapEntry(k.toString(), e?.map((e) => e?.toJson())?.toList())),
      'moneyHistory': instance.moneyHistory,
      'code': instance.code,
      'debt': instance.debt,
      'loans': instance.loans?.map((e) => e?.toJson())?.toList(),
      'stock': instance.stock,
    };
