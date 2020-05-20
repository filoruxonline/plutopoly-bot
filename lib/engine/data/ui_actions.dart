import 'package:PlutopolyExtension/helper/game.dart';

import '../ai/ai_type.dart';
import 'player.dart';

part 'ui_actions.g.dart';

class UIActionsData {
  Screen screenState = Screen.idle;

  bool showDealScreen = false;

  bool shouldMove = true;

  bool get ended {
    if (Game.data == null) return false;
    if (Game.data.running == null || Game.data.running == false) {
      return false;
    }
    if (Game.data.turn > Game.data.settings.maxTurnes) return true;
    if (Game.data.players.length == 1) {
      return true;
    }
    if (!realPlayers) return true;

    return false;
  }

  bool get realPlayers {
    bool real = false;
    Game.data.players.forEach((Player p) {
      if ((p.ai.type ?? AIType.player) == AIType.player) real = true;
    });
    return real;
  }

  int get amountRealPlayers {
    int amount = 0;
    Game.data.players.forEach((Player p) {
      if ((p.ai.type ?? AIType.player) == AIType.player) amount++;
    });
    return amount;
  }

  UIActionsData();

  factory UIActionsData.fromJson(Map<String, dynamic> json) =>
      _$UIActionsDataFromJson(json);
  Map<String, dynamic> toJson() => _$UIActionsDataToJson(this);

  int get moveAnimationMillis {
    return (Game.data.currentDices[0] + Game.data.currentDices[1] * 200 + 500);
  }
}

enum Screen {
  idle,

  move,

  active,
}
