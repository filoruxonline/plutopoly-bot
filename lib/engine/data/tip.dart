part 'tip.g.dart';

enum InfoType { rule, alert, tip, setting }

class Info {
  String title = "";
  String content = "";
  InfoType type = InfoType.rule;
  Info(this.title, this.content, this.type);
  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
