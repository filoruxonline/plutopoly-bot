import 'ai_type.dart';

part 'ai.g.dart';

class AI {
  AIType type;

  AI(this.type);

  AI.player() {
    type = AIType.player;
  }

  factory AI.fromJson(Map<String, dynamic> json) => _$AIFromJson(json);
  Map<String, dynamic> toJson() => _$AIToJson(this);
}
