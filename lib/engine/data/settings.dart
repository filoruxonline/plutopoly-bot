part 'settings.g.dart';

class Settings {
  String name = "";

  bool remotelyBuild = false;

  int goBonus = 200;

  int maxTurnes = 99999;

  bool mustAuction = false;

  int startingMoney = 1500;

  bool hackerScreen = false;

  Settings();

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
