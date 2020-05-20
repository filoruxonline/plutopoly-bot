// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings()
    ..name = json['name'] as String
    ..remotelyBuild = json['remotelyBuild'] as bool
    ..goBonus = json['goBonus'] as int
    ..maxTurnes = json['maxTurnes'] as int
    ..mustAuction = json['mustAuction'] as bool
    ..startingMoney = json['startingMoney'] as int
    ..hackerScreen = json['hackerScreen'] as bool
    ..interest = json['interest'] as int ?? 10;
}

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'name': instance.name,
      'remotelyBuild': instance.remotelyBuild,
      'goBonus': instance.goBonus,
      'maxTurnes': instance.maxTurnes,
      'mustAuction': instance.mustAuction,
      'startingMoney': instance.startingMoney,
      'hackerScreen': instance.hackerScreen,
      'interest': instance.interest,
    };
