// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameData _$GameDataFromJson(Map<String, dynamic> json) {
  return GameData()
    ..running = json['running'] as bool
    ..players = (json['players'] as List)
        ?.map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..currentPlayer = json['currentPlayer'] as int
    ..turn = json['turn'] as int
    ..currentDices =
        (json['currentDices'] as List)?.map((e) => e as int)?.toList()
    ..doublesThrown = json['doublesThrown'] as int
    ..pot = (json['pot'] as num)?.toDouble()
    ..gmap = (json['gmap'] as List)
        ?.map(
            (e) => e == null ? null : Tile.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..settings = json['settings'] == null
        ? null
        : Settings.fromJson(json['settings'] as Map<String, dynamic>)
    ..extensions = (json['extensions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ExtensionEnumMap, e))
        ?.toList()
    ..ui = json['ui'] == null
        ? null
        : UIActionsData.fromJson(json['ui'] as Map<String, dynamic>)
    ..rentPayed = json['rentPayed'] as bool
    ..findingsIndex = json['findingsIndex'] as int
    ..eventIndex = json['eventIndex'] as int
    ..mapConfiguration = json['mapConfiguration'] as String
    ..dealData = json['dealData'] == null
        ? null
        : DealData.fromJson(json['dealData'] as Map<String, dynamic>)
    ..bankData = json['bankData'] == null
        ? null
        : BankData.fromJson(json['bankData'] as Map<String, dynamic>)
    ..version = json['version'] as String
    ..lostPlayers = (json['lostPlayers'] as List)
        ?.map((e) =>
            e == null ? null : Player.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..bot = json['bot'] as bool
    ..transported = json['transported'] as bool ?? false;
}

Map<String, dynamic> _$GameDataToJson(GameData instance) => <String, dynamic>{
      'running': instance.running,
      'players': instance.players?.map((e) => e?.toJson())?.toList(),
      'currentPlayer': instance.currentPlayer,
      'turn': instance.turn,
      'currentDices': instance.currentDices,
      'doublesThrown': instance.doublesThrown,
      'pot': instance.pot,
      'gmap': instance.gmap?.map((e) => e?.toJson())?.toList(),
      'settings': instance.settings?.toJson(),
      'extensions':
          instance.extensions?.map((e) => _$ExtensionEnumMap[e])?.toList(),
      'ui': instance.ui?.toJson(),
      'rentPayed': instance.rentPayed,
      'findingsIndex': instance.findingsIndex,
      'eventIndex': instance.eventIndex,
      'mapConfiguration': instance.mapConfiguration,
      'dealData': instance.dealData?.toJson(),
      'bankData': instance.bankData?.toJson(),
      'version': instance.version,
      'lostPlayers': instance.lostPlayers?.map((e) => e?.toJson())?.toList(),
      'bot': instance.bot,
      'transported': instance.transported,
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

const _$ExtensionEnumMap = {
  Extension.bank: 'bank',
  Extension.transportation: 'transportation',
  Extension.legislation: 'legislation',
  Extension.stock: 'stock',
  Extension.drainTheLake: 'drainTheLake',
};
