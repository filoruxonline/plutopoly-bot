part 'info.g.dart';

class UpdateInfo {
  String title = "";

  String leading = "i";
  UpdateInfo({this.title, this.leading: "i"});

  factory UpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$UpdateInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateInfoToJson(this);
}
